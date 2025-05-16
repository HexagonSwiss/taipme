package org.whitepaper.mobile.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import org.whitepaper.bean.Messaggio;
import org.whitepaper.business.service.MessaggioService;
import org.whitepaper.business.service.custom.MessaggioCustomService;
import org.whitepaper.mobile.dto.CreateMessageRequestDto;
import org.whitepaper.mobile.dto.PaperActionFlagsDto;
import org.whitepaper.mobile.dto.PaperContentDto;
import org.whitepaper.mobile.dto.PaperStatusDto;
import org.whitepaper.mobile.dto.UserPapersSummaryDto;
import org.whitepaper.utility.ConstantsDefinition;
import org.whitepaper.utility.UtilityFunction;
import org.whitepaper.bean.AnaUtente;
import org.whitepaper.business.service.AnaUtenteService;

import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/mobile/papers")
public class MobilePaperController {

    private static final Logger paperLogger = LoggerFactory.getLogger(MobilePaperController.class);

    @Autowired
    private MessaggioCustomService messaggioCustomService;

    @Autowired
    private AnaUtenteService anaUtenteService;

    @Autowired
    private MessaggioService messaggioService;

    // Helper method to get current authenticated user's ID
    // TODO: THIS IS NOT A RESPONSABILITY OF THIS CONTROLLER
    private Integer getCurrentUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()
                && !"anonymousUser".equals(authentication.getPrincipal().toString())) {
            String email = authentication.getName();
            AnaUtente currentUser = anaUtenteService.findUtenteByEmail(email);
            if (currentUser != null) {
                return currentUser.getIdUte();
            }

            paperLogger.warn("Could not find AnaUtente for authenticated email: {}", email);
        }

        return null;
    }

    // Helper method from HomeRegController: isFoglioGiaUsato
    private boolean isPaperUsedByAuthorForPublicMessage(Integer userId, Integer paperId) {
        if (userId == null || paperId == null)
            return false;
        Messaggio existingMsg = messaggioCustomService.findMsgByAutoreAndIdFoglio(userId, paperId);
        return existingMsg != null && ConstantsDefinition.CODMSG_PUB.equals(existingMsg.getCodTipMsg());
    }

    private int getHighestPaperIdUsedByAuthor(Integer authorId) {
        if (authorId == null)
            return 1;
        List<Messaggio> userMessages = messaggioCustomService.findMsgByAutore(authorId);
        if (userMessages == null || userMessages.isEmpty()) {
            return 0; // No papers used yet by authoring
        }
        int maxPaperId = 0;
        for (Messaggio msg : userMessages) {
            if (msg != null && msg.getIdFoglio() != null) {
                if (msg.getIdFoglio() > maxPaperId) {
                    maxPaperId = msg.getIdFoglio();
                }
            }
        }
        return maxPaperId;
    }

    @RequestMapping(value = "/status", method = RequestMethod.GET)
    public ResponseEntity<?> getUserPapersSummary() {
        Integer currentUserId = getCurrentUserId();

        if (currentUserId == null) {
            return new ResponseEntity<>("{\"error\":\"User not authenticated or user ID could not be retrieved.\"}",
                    HttpStatus.UNAUTHORIZED);
        }

        paperLogger.info("Fetching papers summary for user ID: {}", currentUserId);

        List<Messaggio> userAuthoredMessages = messaggioCustomService.findMsgByAutore(currentUserId);

        int highestPaperIdUsed = getHighestPaperIdUsedByAuthor(currentUserId);
        int papersToDisplayInSummary = Math.max(1, highestPaperIdUsed);

        List<PaperStatusDto> paperStatuses = new ArrayList<>();

        for (int i = 1; i <= papersToDisplayInSummary; i++) {
            int paperId = i;
            boolean hasReply = false;
            boolean myTurnToReply = false;

            Messaggio messageOnThisPaper = null;
            if (userAuthoredMessages != null) {
                for (Messaggio msg : userAuthoredMessages) {
                    if (msg.getIdFoglio() != null && msg.getIdFoglio() == paperId) {
                        messageOnThisPaper = msg;
                        break;
                    }
                }
            }

            if (messageOnThisPaper != null) {
                hasReply = messageOnThisPaper.isPresenteRisposta();
                if (ConstantsDefinition.CODMSG_LET.equals(messageOnThisPaper.getCodTipMsg())) {
                    myTurnToReply = true;
                }
            }
            paperStatuses.add(new PaperStatusDto(paperId, hasReply, myTurnToReply));
        }

        boolean canAddNewPaper = papersToDisplayInSummary < ConstantsDefinition.NUM_MAX_FOGLI;

        UserPapersSummaryDto summary = new UserPapersSummaryDto(
                paperStatuses,
                ConstantsDefinition.NUM_MAX_FOGLI,
                canAddNewPaper);

        return ResponseEntity.ok(summary);
    }

    // NEW ENDPOINT to get content of a specific paper
    @RequestMapping(value = "/{paperId}", method = RequestMethod.GET)
    public ResponseEntity<?> getPaperContent(@PathVariable("paperId") Integer paperId) {
        Integer currentUserId = getCurrentUserId();

        if (currentUserId == null) {
            return new ResponseEntity<>("{\"error\":\"User not authenticated.\"}", HttpStatus.UNAUTHORIZED);
        }

        paperLogger.info("Fetching content for paper ID: {} for user ID: {}", paperId, currentUserId);

        if (paperId == null || paperId < 1 || paperId > ConstantsDefinition.NUM_MAX_FOGLI) {
            paperLogger.warn("Invalid paperId requested: {}", paperId);
            return new ResponseEntity<>("{\"error\":\"Invalid paper ID.\"}", HttpStatus.BAD_REQUEST);
        }

        PaperContentDto paperContent = new PaperContentDto(paperId);
        PaperActionFlagsDto actionFlags = paperContent.getActionFlags();
        Messaggio mainMessageForPaper = null;
        Messaggio userSpecificMessage = messaggioCustomService.findMsgByAutoreAndIdFoglio(currentUserId, paperId);

        if (userSpecificMessage != null) {
            mainMessageForPaper = userSpecificMessage;

            actionFlags.setCanWriteNewOnThisPaper(false);
            actionFlags.setCanReadOtherRandomMessages(false);
            paperContent.setPaperTitle(ConstantsDefinition.TIT_MSG_TUO);

            if (ConstantsDefinition.CODMSG_PUB.equals(userSpecificMessage.getCodTipMsg())) {
                paperContent.setPaperTitle(ConstantsDefinition.TIT_MSG_TUO_PUB);
                if (userSpecificMessage.getIdMsgReply() == null) {
                    actionFlags.setCanReplyToMainMessage(false);
                } else {
                    Messaggio replyMessage = messaggioService.findById(userSpecificMessage.getIdMsgReply());
                    if (replyMessage != null && replyMessage.getIdUteAut() != null &&
                            replyMessage.getIdUteAut().equals(userSpecificMessage.getIdUteReply())) {

                        mainMessageForPaper = replyMessage;
                        mainMessageForPaper.setTitMsg(ConstantsDefinition.RIS_MSG_ALTRI);
                        actionFlags.setCanReplyToMainMessage(true);
                    } else {
                        actionFlags.setCanReplyToMainMessage(false); // Reply chain issue
                    }
                }
            } else if (ConstantsDefinition.CODMSG_PRI.equals(userSpecificMessage.getCodTipMsg())) {
                // User's last message was PRI (they sent the last message in the conversation)
                paperContent.setPaperTitle(ConstantsDefinition.TIT_MSG_TUO_PRIV); // "You replied"
                actionFlags.setCanReplyToMainMessage(false); // Not their turn
            } else if (ConstantsDefinition.CODMSG_LET.equals(userSpecificMessage.getCodTipMsg())) {
                actionFlags.setCanReplyToMainMessage(true);
                paperContent.setPaperTitle(ConstantsDefinition.RIS_MSG_ALTRI);
                if (userSpecificMessage.getIdMsgReply() != null) {
                    Messaggio messageUserIsReplyingTo = messaggioService.findById(userSpecificMessage.getIdMsgReply());
                    if (messageUserIsReplyingTo != null) {
                        mainMessageForPaper = messageUserIsReplyingTo; // Display the message they are replying to
                    } else {
                        paperLogger.error(
                                "Data inconsistency: User's message {} (paper {}) is LET, implying a reply with id {}, but that reply was not found.",
                                userSpecificMessage.getIdMsg(), paperId, userSpecificMessage.getIdMsgReply());
                    }
                } else {
                    paperLogger.error(
                            "Data inconsistency: User's message {} (paper {}) is LET, but idMsgReply is null.",
                            userSpecificMessage.getIdMsg(), paperId);
                }
            }
        } else {
            // Paper is "empty" for this user - load a random public message
            actionFlags.setCanWriteNewOnThisPaper(!isPaperUsedByAuthorForPublicMessage(currentUserId, paperId));
            actionFlags.setCanReadOtherRandomMessages(true);

            mainMessageForPaper = messaggioCustomService.findMsgRandomNoReplyAutoreDiverso(currentUserId,
                    ConstantsDefinition.CODMSG_PUB);

            if (mainMessageForPaper != null) {
                mainMessageForPaper.setTitMsg(ConstantsDefinition.TIT_MSG_ALTRI);
                actionFlags.setCanReplyToMainMessage(true);
                paperContent.setPaperTitle("Public Message"); // Or similar
            } else {
                paperContent.setPaperTitle("Write New or Read Public");
                actionFlags.setCanReplyToMainMessage(false);
            }
        }

        paperContent.setMainMessage(mainMessageForPaper);

        if (mainMessageForPaper != null && mainMessageForPaper.getIdMsg() != null) {
            boolean isCurrentUserAuthorOfMain = mainMessageForPaper.getIdUteAut() != null
                    && mainMessageForPaper.getIdUteAut().equals(currentUserId);

            // Tear logic: User can tear if they are the author of the main message shown,
            // OR if the main message shown is a reply TO their message (meaning they are
            // part of the conversation).
            // The original strappaMsg logic was more complex, checking if user is idUteAut
            // or idUteReply of the *specific message being torn*.
            // For a simplified approach here:
            // If it's their public message: they can tear.
            // If it's a private conversation they are part of (either their message or a
            // reply to them): they can tear.
            // If it's a random public message: they cannot tear it.
            if (userSpecificMessage != null) { // Implies it's related to the user (their message or a conversation they
                                               // are in)
                actionFlags.setCanTearMainMessage(true);
            } else if (mainMessageForPaper != null
                    && ConstantsDefinition.CODMSG_PUB.equals(mainMessageForPaper.getCodTipMsg())) {
                // It's a random public message they are reading, they can't tear it.
                actionFlags.setCanTearMainMessage(false);
            }

            if (!isCurrentUserAuthorOfMain
                    && ConstantsDefinition.CODMSG_PUB.equals(mainMessageForPaper.getCodTipMsg())) {
                actionFlags.setCanReportMainMessage(true);
            }
        }

        if (mainMessageForPaper == null && !actionFlags.isCanWriteNewOnThisPaper()) {
            paperContent.setPaperTitle("Paper is currently empty");
        }

        return ResponseEntity.ok(paperContent);
    }

    @RequestMapping(value = "/{paperId}/messages", method = RequestMethod.POST)
    public ResponseEntity<?> createMessageOnPaper(
            @PathVariable("paperId") Integer paperId,
            @RequestBody CreateMessageRequestDto messageRequest) {

        Integer currentUserId = getCurrentUserId();
        if (currentUserId == null) {
            return new ResponseEntity<>("{\"error\":\"User not authenticated.\"}", HttpStatus.UNAUTHORIZED);
        }
        paperLogger.info("User ID: {} attempting to create message on paper ID: {}", currentUserId, paperId);

        // 1. Validate paperId
        if (paperId == null || paperId < 1 || paperId > ConstantsDefinition.NUM_MAX_FOGLI) {
            paperLogger.warn("Invalid paperId for new message: {}", paperId);
            return new ResponseEntity<>("{\"error\":\"Invalid paper ID.\"}", HttpStatus.BAD_REQUEST);
        }

        // 2. Validate message content
        if (UtilityFunction.isFieldBlank(messageRequest.getDesMsg())) {
            paperLogger.warn("Message description is empty for user ID: {}", currentUserId);
            return new ResponseEntity<>("{\"error\":\"Message content cannot be empty.\"}", HttpStatus.BAD_REQUEST);
        }

        // 3. Check if this paperId is available for the user to write a NEW PUBLIC
        // message
        // (Similar to HomeRegController.savemsg and writemsg logic)
        // Rule: "un foglio un messaggio" - user cannot have multiple active authored
        // public messages on the same paperId.
        Messaggio existingMessageOnPaperByAuthor = messaggioCustomService.findMsgByAutoreAndIdFoglio(currentUserId,
                paperId);
        if (existingMessageOnPaperByAuthor != null) {
            // If a message exists, it must not be a PUB message or must have been replied
            // to (making it PRI/LET)
            // If it's still their own PUB message, they can't post another one on top.
            if (ConstantsDefinition.CODMSG_PUB.equals(existingMessageOnPaperByAuthor.getCodTipMsg()) &&
                    existingMessageOnPaperByAuthor.getIdMsgReply() == null) { // Check if it's their unreplied public
                                                                              // message
                paperLogger.warn("User ID: {} already has a public message on paper ID: {}. Cannot create another.",
                        currentUserId, paperId);
                return new ResponseEntity<>("{\"error\":\"Paper is already in use by your public message.\"}",
                        HttpStatus.CONFLICT); // 409 Conflict
            }
            // If it's a private conversation (PRI/LET), they also can't use this paper for
            // a *new public* message.
            // The "write new" action is for an "empty" slot for the user.
            if (ConstantsDefinition.CODMSG_PRI.equals(existingMessageOnPaperByAuthor.getCodTipMsg()) ||
                    ConstantsDefinition.CODMSG_LET.equals(existingMessageOnPaperByAuthor.getCodTipMsg())) {
                paperLogger.warn(
                        "User ID: {} is in a private conversation on paper ID: {}. Cannot create a new public message here.",
                        currentUserId, paperId);
                return new ResponseEntity<>("{\"error\":\"Paper is in use for a private conversation.\"}",
                        HttpStatus.CONFLICT);
            }
        }

        // 4. Check if user has reached max number of active public messages (if such a
        // limit exists beyond 5 papers)
        // The 5 paper limit is more about slots. This check is about how many *active
        // public messages* they can have.
        // HomeRegController didn't seem to have a separate limit for this beyond the
        // paper slot availability.
        // For now, we assume if the paper slot is valid for writing (not used by their
        // own PUB message), it's okay.

        // 5. Call the service to insert the new public message
        // String titMsg = messageRequest.getTitMsg(); // Optional title
        try {
            Messaggio createdMessage = messaggioCustomService.insertMsgAndTags(
                    currentUserId,
                    null, // idUteReply (null for new public message)
                    messageRequest.getDesMsg(),
                    // messageRequest.getTitMsg(), // Pass title if your service method supports it
                    ConstantsDefinition.CODMSG_PUB,
                    paperId,
                    null, // idMsgReply (null for new public message)
                    true // msgUteReg (message from registered user)
            );

            if (createdMessage == null || createdMessage.getIdMsg() == null) {
                paperLogger.error("Failed to create message for user ID: {} on paper ID: {}. Service returned null.",
                        currentUserId, paperId);
                return new ResponseEntity<>("{\"error\":\"Failed to save message.\"}",
                        HttpStatus.INTERNAL_SERVER_ERROR);
            }

            paperLogger.info("Message created successfully with ID: {} for user ID: {} on paper ID: {}",
                    createdMessage.getIdMsg(), currentUserId, paperId);
            return new ResponseEntity<>(createdMessage, HttpStatus.CREATED);

        } catch (Exception e) {
            paperLogger.error("Exception creating message for user ID: {} on paper ID: {}: {}", currentUserId, paperId,
                    e.getMessage(), e);
            return new ResponseEntity<>("{\"error\":\"An internal error occurred while saving the message.\"}",
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
