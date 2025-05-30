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
import org.whitepaper.bean.MessaggioSegnalato;
import org.whitepaper.business.service.MessaggioService;
import org.whitepaper.business.service.custom.MessaggioCustomService;
import org.whitepaper.business.service.custom.MessaggioSegnalatoCustomService;
import org.whitepaper.business.service.custom.UtenteActionCustomService;
import org.whitepaper.mobile.dto.CreateMessageRequestDto;
import org.whitepaper.mobile.dto.PaperActionFlagsDto;
import org.whitepaper.mobile.dto.PaperContentDto;
import org.whitepaper.mobile.dto.PaperStatusDto;
import org.whitepaper.mobile.dto.ReplyMessageRequestDto;
import org.whitepaper.mobile.dto.ReportMessageRequestDto;
import org.whitepaper.mobile.dto.UserPapersSummaryDto;
import org.whitepaper.utility.ConstantsDefinition;
import org.whitepaper.utility.UtilityFunction;
import org.whitepaper.bean.AnaUtente;
import org.whitepaper.business.service.AnaUtenteService;

import java.util.ArrayList;
import java.util.Date;
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

    @Autowired
    private UtenteActionCustomService utenteActionCustomService;

    @Autowired
    private MessaggioSegnalatoCustomService messaggioSegnalatoCustomService;

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

    private boolean isPaperUsedByAuthorForNewPublicMessage(Integer userId, Integer paperId) {
        if (userId == null || paperId == null)
            return true;
        Messaggio existingMsg = messaggioCustomService.findMsgByAutoreAndIdFoglio(userId, paperId);
        return existingMsg != null;
    }

    private int getHighestPaperIdActiveForUser(Integer authorId) {
        if (authorId == null)
            return 0;
        List<Messaggio> userMessages = messaggioCustomService.findMsgByAutore(authorId);
        if (userMessages == null || userMessages.isEmpty()) {
            return 0;
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

        int highestPaperIdUsed = getHighestPaperIdActiveForUser(currentUserId);
        int papersToDisplayInSummary = Math.max(1, highestPaperIdUsed);

        List<PaperStatusDto> paperStatuses = new ArrayList<>();

        for (int i = 1; i <= papersToDisplayInSummary; i++) {
            int paperId = i;
            boolean hasReply = false;
            boolean myTurnToReply = false;
            boolean isUserAuthoredSlot = false;
            Messaggio messageOnThisPaper = null;

            if (userAuthoredMessages != null) {
                for (Messaggio msg : userAuthoredMessages) {
                    if (msg.getIdFoglio() != null && msg.getIdFoglio() == paperId) {
                        messageOnThisPaper = msg;
                        isUserAuthoredSlot = true;
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

            paperStatuses.add(new PaperStatusDto(paperId, hasReply, myTurnToReply, isUserAuthoredSlot));
        }

        boolean canAddNewPaper = papersToDisplayInSummary < ConstantsDefinition.NUM_MAX_FOGLI;

        if (canAddNewPaper) {
            int length = paperStatuses.size();
            paperStatuses.add(new PaperStatusDto(
                    length + 1, // This is the "virtual" paper ID for adding new real papers
                    false, // No replies on this virtual paper
                    false, // Not the user's turn to reply on this virtual paper
                    false // This is not a user-authored slot, it's a new paper slot
            ));
        }

        UserPapersSummaryDto summary = new UserPapersSummaryDto(
                paperStatuses,
                canAddNewPaper);

        return ResponseEntity.ok(summary);
    }

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

        int highestPaperIdActive = getHighestPaperIdActiveForUser(currentUserId);
        int maxAccessiblePaperId = Math.max(1, highestPaperIdActive);
        if (highestPaperIdActive < ConstantsDefinition.NUM_MAX_FOGLI) {
            maxAccessiblePaperId = Math.max(maxAccessiblePaperId, highestPaperIdActive + 1);
        }

        if (paperId > maxAccessiblePaperId) {
            paperLogger.warn(
                    "Attempt to access paperId {} which is not yet accessible for user {}. Highest active: {}, Max accessible based on summary: {}",
                    paperId, currentUserId, highestPaperIdActive, maxAccessiblePaperId);
            return new ResponseEntity<>("{\"error\":\"Cannot access this paper ID yet.\"}", HttpStatus.FORBIDDEN);
        }

        PaperContentDto paperContent = new PaperContentDto(paperId);
        PaperActionFlagsDto actionFlags = paperContent.getActionFlags();
        Messaggio mainMessageForPaper = null;
        Messaggio usersAnchorMessageOnPaper = messaggioCustomService.findMsgByAutoreAndIdFoglio(currentUserId, paperId);

        if (usersAnchorMessageOnPaper != null) {
            mainMessageForPaper = usersAnchorMessageOnPaper;
            actionFlags.setCanWriteNewOnThisPaper(false);
            actionFlags.setCanReadOtherRandomMessages(false);
            paperContent.setPaperTitle(ConstantsDefinition.TIT_MSG_TUO);

            String anchorMsgType = usersAnchorMessageOnPaper.getCodTipMsg();
            Integer anchorMsgReplyId = usersAnchorMessageOnPaper.getIdMsgReply();
            Integer anchorMsgAuthorId = usersAnchorMessageOnPaper.getIdUteAut(); // Author of usersAnchorMessageOnPaper
            Integer anchorMsgReplierId = usersAnchorMessageOnPaper.getIdUteReply(); // User who replied to
                                                                                    // usersAnchorMessageOnPaper

            if (ConstantsDefinition.CODMSG_PUB.equals(anchorMsgType)) {
                paperContent.setPaperTitle(ConstantsDefinition.TIT_MSG_TUO_PUB);
                if (anchorMsgReplyId == null) {
                    actionFlags.setCanReplyToMainMessage(false);
                } else {
                    // Fetch the actual reply message
                    Messaggio replyToUsersPublicMessage = messaggioCustomService.findMsgPerConversazionePrivata(
                            anchorMsgReplyId, // ID of the reply message
                            anchorMsgReplierId, // Author of the reply message
                            anchorMsgAuthorId, // Recipient of the reply (current user, who authored
                                               // usersAnchorMessageOnPaper)
                            // ConstantsDefinition.CODMSG_PRI, // This was the incorrect 4th param,
                            // findMsgPerConversazionePrivata expects idMsgReply here
                            usersAnchorMessageOnPaper.getIdMsg() // The message ID that this reply is for
                    );

                    if (replyToUsersPublicMessage != null) {
                        mainMessageForPaper = replyToUsersPublicMessage;
                        paperContent.setPaperTitle(ConstantsDefinition.RIS_MSG_ALTRI);
                        // Mark user's original public message as read (LET) because they are viewing
                        // its reply
                        messaggioCustomService.updateCodTipMsgAndFindMsgReply(usersAnchorMessageOnPaper.getIdMsg(),
                                ConstantsDefinition.CODMSG_LET);
                        actionFlags.setCanReplyToMainMessage(true); // Now it's current user's turn to reply to this
                                                                    // reply
                    } else {
                        actionFlags.setCanReplyToMainMessage(false);
                        mainMessageForPaper = usersAnchorMessageOnPaper;
                        paperLogger.warn(
                                "Could not fetch the specific reply (ID: {}) to user's public message (ID: {}).",
                                anchorMsgReplyId, usersAnchorMessageOnPaper.getIdMsg());
                    }
                }
            } else if (ConstantsDefinition.CODMSG_PRI.equals(anchorMsgType)) {
                // usersAnchorMessageOnPaper is PRI.
                // This means current user sent the last message in this thread (if it's their
                // message),
                // OR it's their original message that was replied to, and they haven't "viewed"
                // that reply yet
                // (to change usersAnchorMessageOnPaper to LET).

                if (anchorMsgAuthorId.equals(currentUserId)) { // Current user authored this PRI message
                    mainMessageForPaper = usersAnchorMessageOnPaper;
                    paperContent.setPaperTitle(ConstantsDefinition.TIT_MSG_TUO_PRIV);
                    actionFlags.setCanReplyToMainMessage(false); // Not their turn, they sent the last one
                } else if (anchorMsgReplierId != null && anchorMsgReplierId.equals(currentUserId)
                        && anchorMsgReplyId != null) {
                    // This PRI message was sent BY THE OTHER USER (anchorMsgAuthorId) TO THE
                    // CURRENT USER (anchorMsgReplierId)
                    // And anchorMsgReplyId points to the message the other user replied to (which
                    // should be one of current user's messages)
                    // This is the message the current user needs to see.
                    mainMessageForPaper = usersAnchorMessageOnPaper; // Display the other user's PRI message
                    paperContent.setPaperTitle(ConstantsDefinition.RIS_MSG_ALTRI); // "Message Received"

                    // Mark this received message (usersAnchorMessageOnPaper) as LET from the
                    // perspective of the *other user's message it replied to*.
                    // The message that needs to be marked LET is the one identified by
                    // usersAnchorMessageOnPaper.getIdMsgReply(),
                    // and it should be marked LET because currentUserId
                    // (usersAnchorMessageOnPaper.getIdUteReply()) is viewing it.
                    if (usersAnchorMessageOnPaper.getIdMsgReply() != null) {
                        messaggioCustomService.updateCodTipMsgAndFindMsgReply(usersAnchorMessageOnPaper.getIdMsgReply(),
                                ConstantsDefinition.CODMSG_LET);
                    }
                    actionFlags.setCanReplyToMainMessage(true); // Now it's current user's turn.
                } else {
                    // Fallback or unclear state
                    mainMessageForPaper = usersAnchorMessageOnPaper;
                    paperContent.setPaperTitle(ConstantsDefinition.TIT_MSG_TUO_PRIV); // Default to "you replied"
                    actionFlags.setCanReplyToMainMessage(false);
                    paperLogger.warn("CODMSG_PRI state for message {} is ambiguous for user {}.",
                            usersAnchorMessageOnPaper.getIdMsg(), currentUserId);
                }

            } else if (ConstantsDefinition.CODMSG_LET.equals(anchorMsgType)) {
                // usersAnchorMessageOnPaper is LET. This means current user (author of this LET
                // message)
                // has read the other person's reply, and it's now their turn to reply.
                // The message to display is the one they are replying TO (the other person's
                // last message).
                actionFlags.setCanReplyToMainMessage(true);
                paperContent.setPaperTitle(ConstantsDefinition.RIS_MSG_ALTRI);

                if (anchorMsgReplyId != null) {
                    // Fetch the actual message they are replying to.
                    // Its author should be anchorMsgReplierId. Its recipient currentUserId.
                    mainMessageForPaper = messaggioCustomService.findMsgPerConversazionePrivata(
                            anchorMsgReplyId, // ID of the message from other user
                            anchorMsgReplierId, // Author of that message (other user)
                            anchorMsgAuthorId, // Recipient (current user, author of the LET message)
                            // ConstantsDefinition.CODMSG_PRI, // This was the error, remove
                            usersAnchorMessageOnPaper.getIdMsg() // This LET message is a reply to anchorMsgReplyId
                    );
                    if (mainMessageForPaper == null) {
                        mainMessageForPaper = messaggioService.findById(anchorMsgReplyId);
                        if (mainMessageForPaper == null) {
                            paperLogger.error(
                                    "Data inconsistency: User's message {} is LET, but the reply (ID: {}) it points to was not found by any means.",
                                    usersAnchorMessageOnPaper.getIdMsg(), anchorMsgReplyId);
                            mainMessageForPaper = usersAnchorMessageOnPaper;
                            actionFlags.setCanReplyToMainMessage(false);
                        }
                    }
                } else {
                    paperLogger.error("Data inconsistency: User's message {} is LET, but idMsgReply is null.",
                            usersAnchorMessageOnPaper.getIdMsg());
                    mainMessageForPaper = usersAnchorMessageOnPaper;
                    actionFlags.setCanReplyToMainMessage(false);
                }
            }
        } else {
            actionFlags.setCanWriteNewOnThisPaper(!isPaperUsedByAuthorForNewPublicMessage(currentUserId, paperId));
            actionFlags.setCanReadOtherRandomMessages(true);
            mainMessageForPaper = messaggioCustomService.findMsgRandomNoReplyAutoreDiverso(currentUserId,
                    ConstantsDefinition.CODMSG_PUB);
            if (mainMessageForPaper != null) {
                paperContent.setPaperTitle(ConstantsDefinition.TIT_MSG_ALTRI);
                actionFlags.setCanReplyToMainMessage(true);
            } else {
                paperContent.setPaperTitle("Write New or Read Public");
                actionFlags.setCanReplyToMainMessage(false);
                actionFlags.setCanReadOtherRandomMessages(false);
            }
        }

        paperContent.setMainMessage(mainMessageForPaper);

        if (mainMessageForPaper != null && mainMessageForPaper.getIdMsg() != null) {
            boolean isCurrentUserAuthorOfMainDisplayedMessage = mainMessageForPaper.getIdUteAut() != null
                    && mainMessageForPaper.getIdUteAut().equals(currentUserId);

            if (usersAnchorMessageOnPaper != null) {
                actionFlags.setCanTearMainMessage(true);
            } else {
                actionFlags.setCanTearMainMessage(false);
            }

            if (!isCurrentUserAuthorOfMainDisplayedMessage &&
                    mainMessageForPaper.getCodTipMsg() != null &&
                    ConstantsDefinition.CODMSG_PUB.equals(mainMessageForPaper.getCodTipMsg())) {
                actionFlags.setCanReportMainMessage(true);
            }
        }

        if (mainMessageForPaper == null && !actionFlags.isCanWriteNewOnThisPaper()) {
            paperContent.setPaperTitle("Paper is currently empty and cannot write new.");
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
                    existingMessageOnPaperByAuthor.getIdMsgReply() == null) {
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

        // 4. Call the service to insert the new public message
        try {
            Messaggio createdMessage = messaggioCustomService.insertMsgAndTags(
                    currentUserId,
                    null, // idUteReply (null for new public message)
                    messageRequest.getDesMsg(),
                    ConstantsDefinition.CODMSG_PUB,
                    paperId,
                    null, // idMsgReply (null for new public message)
                    true);

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

    @RequestMapping(value = "/{paperId}/messages/{messageIdToReplyTo}/reply", method = RequestMethod.POST)
    public ResponseEntity<?> replyToMessage(
            @PathVariable("paperId") Integer paperId,
            @PathVariable("messageIdToReplyTo") Integer messageIdToReplyTo,
            @RequestBody ReplyMessageRequestDto replyRequest) {

        Integer currentUserId = getCurrentUserId();
        if (currentUserId == null) {
            return new ResponseEntity<>("{\"error\":\"User not authenticated.\"}", HttpStatus.UNAUTHORIZED);
        }
        paperLogger.info("User ID: {} attempting to reply to message ID: {} on paper ID: {}", currentUserId,
                messageIdToReplyTo, paperId);

        // 1. Validate inputs
        if (paperId == null || messageIdToReplyTo == null || UtilityFunction.isFieldBlank(replyRequest.getDesMsg())) {
            return new ResponseEntity<>(
                    "{\"error\":\"Paper ID, message ID to reply to, and reply content are required.\"}",
                    HttpStatus.BAD_REQUEST);
        }

        // 2. Fetch the original message being replied to
        Messaggio originalMessage = messaggioService.findById(messageIdToReplyTo);
        if (originalMessage == null) {
            paperLogger.warn("Reply attempt to non-existent message ID: {}", messageIdToReplyTo);
            return new ResponseEntity<>("{\"error\":\"Message being replied to not found.\"}", HttpStatus.NOT_FOUND);
        }

        // 3. Perform validations (inspired by
        // HomeRegController.isCheckConversazioneValida and savereply)

        // 3.a. Cannot reply to your own message to start a conversation
        if (originalMessage.getIdUteAut() != null && originalMessage.getIdUteAut().equals(currentUserId) &&
                ConstantsDefinition.CODMSG_PUB.equals(originalMessage.getCodTipMsg())
                && originalMessage.getIdMsgReply() == null) {
            paperLogger.warn("User {} cannot reply to their own initial public message ID: {}", currentUserId,
                    messageIdToReplyTo);
            return new ResponseEntity<>("{\"error\":\"Cannot reply to your own initial message.\"}",
                    HttpStatus.FORBIDDEN);
        }

        // 3.b. If replying to a public message (first reply)
        if (ConstantsDefinition.CODMSG_PUB.equals(originalMessage.getCodTipMsg())) {
            if (originalMessage.getIdMsgReply() != null) { // Should not happen if it's PUB, but as a safeguard
                paperLogger.warn("Attempting to reply to a public message ID {} that already has a reply.",
                        messageIdToReplyTo);
                return new ResponseEntity<>("{\"error\":\"This public message has already been replied to.\"}",
                        HttpStatus.CONFLICT);
            }
            // Check if the paperId is free for the current user (replier) to use for this
            // new conversation
            Messaggio existingMessageOnPaperByReplier = messaggioCustomService.findMsgByAutoreAndIdFoglio(currentUserId,
                    paperId);
            if (existingMessageOnPaperByReplier != null) {
                paperLogger.warn("User {} trying to use paperId {} for a new reply, but it's already in use by them.",
                        currentUserId, paperId);
                return new ResponseEntity<>("{\"error\":\"Selected paper is already in use by you.\"}",
                        HttpStatus.CONFLICT);
            }
        }
        // 3.c. If replying within an existing private conversation
        else if (ConstantsDefinition.CODMSG_PRI.equals(originalMessage.getCodTipMsg())
                || ConstantsDefinition.CODMSG_LET.equals(originalMessage.getCodTipMsg())) {
            // Ensure current user is part of this conversation
            boolean isParticipant = (originalMessage.getIdUteAut() != null
                    && originalMessage.getIdUteAut().equals(currentUserId)) ||
                    (originalMessage.getIdUteReply() != null && originalMessage.getIdUteReply().equals(currentUserId));
            if (!isParticipant) {
                paperLogger.warn("User {} is not a participant in the conversation of message ID: {}", currentUserId,
                        messageIdToReplyTo);
                return new ResponseEntity<>("{\"error\":\"You are not part of this conversation.\"}",
                        HttpStatus.FORBIDDEN);
            }
            // Ensure it's the current user's turn.
            // If originalMessage.codTipMsg is PRI, it means originalMessage.idUteAut sent
            // it.
            // Reply is allowed if currentUserId is originalMessage.idUteReply.
            // If originalMessage.codTipMsg is LET, it means originalMessage.idUteAut (who
            // received a reply) read it.
            // Reply is allowed if currentUserId is originalMessage.idUteAut.
            boolean isMyTurn = false;
            if (ConstantsDefinition.CODMSG_PRI.equals(originalMessage.getCodTipMsg()) &&
                    originalMessage.getIdUteReply() != null && originalMessage.getIdUteReply().equals(currentUserId)) {
                isMyTurn = true;
            } else if (ConstantsDefinition.CODMSG_LET.equals(originalMessage.getCodTipMsg()) &&
                    originalMessage.getIdUteAut() != null && originalMessage.getIdUteAut().equals(currentUserId)) {
                isMyTurn = true;
            }

            if (!isMyTurn) {
                paperLogger.warn("User {} trying to reply out of turn to message ID: {}", currentUserId,
                        messageIdToReplyTo);
                return new ResponseEntity<>("{\"error\":\"It's not your turn to reply in this conversation.\"}",
                        HttpStatus.FORBIDDEN);
            }
            // Ensure the paperId in path matches the conversation's paperId
            if (originalMessage.getIdFoglio() == null || !originalMessage.getIdFoglio().equals(paperId)) {
                paperLogger.warn("Paper ID mismatch for reply. Path paperId: {}, Message paperId: {}", paperId,
                        originalMessage.getIdFoglio());
                return new ResponseEntity<>("{\"error\":\"Paper ID mismatch for this conversation.\"}",
                        HttpStatus.BAD_REQUEST);
            }
        } else {
            paperLogger.warn("Attempting to reply to a message (ID: {}) with an unhandled type: {}", messageIdToReplyTo,
                    originalMessage.getCodTipMsg());
            return new ResponseEntity<>("{\"error\":\"Cannot reply to this type of message.\"}",
                    HttpStatus.BAD_REQUEST);
        }

        // 4. Call the service to insert the reply
        try {
            Messaggio createdReply = messaggioCustomService.insertReplyMsg(
                    messageIdToReplyTo, // ID of the message being replied to
                    originalMessage.getIdUteAut(), // Author of that original message
                    currentUserId, // Author of this new reply (current user)
                    replyRequest.getDesMsg(), // Content of the reply
                    paperId // The paper ID where this conversation takes place
            );

            if (createdReply == null) {
                paperLogger.error(
                        "Failed to create reply for user ID: {} to message ID: {}. Service returned null (possibly conversation deleted).",
                        currentUserId, messageIdToReplyTo);
                // This message is from HomeRegController.savereply
                return new ResponseEntity<>(
                        "{\"error\":\"Sorry: the conversation was deleted by the other person...\"}", HttpStatus.GONE); // 410
                                                                                                                        // Gone
            }

            paperLogger.info("Reply created successfully with ID: {} for user ID: {} on paper ID: {}",
                    createdReply.getIdMsg(), currentUserId, paperId);
            return new ResponseEntity<>(createdReply, HttpStatus.CREATED);

        } catch (Exception e) {
            paperLogger.error("Exception creating reply for user ID: {} to message ID: {}: {}", currentUserId,
                    messageIdToReplyTo, e.getMessage(), e);
            return new ResponseEntity<>("{\"error\":\"An internal error occurred while saving the reply.\"}",
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/messages/{messageId}/tear", method = RequestMethod.POST)
    public ResponseEntity<?> tearMessage(@PathVariable("messageId") Integer messageId) {
        Integer currentUserId = getCurrentUserId();
        if (currentUserId == null) {
            return new ResponseEntity<>("{\"error\":\"User not authenticated.\"}", HttpStatus.UNAUTHORIZED);
        }
        paperLogger.info("User ID: {} attempting to tear message ID: {}", currentUserId, messageId);

        if (messageId == null) {
            return new ResponseEntity<>("{\"error\":\"Message ID is required.\"}", HttpStatus.BAD_REQUEST);
        }

        Messaggio messageToTear = messaggioService.findById(messageId);
        if (messageToTear == null) {
            paperLogger.warn("Attempt to tear non-existent message ID: {}", messageId);
            return new ResponseEntity<>("{\"error\":\"Message not found.\"}", HttpStatus.NOT_FOUND);
        }

        // Authorization: User must be author or replier of the message to tear it
        boolean isAuthor = messageToTear.getIdUteAut() != null && messageToTear.getIdUteAut().equals(currentUserId);
        boolean isReplier = messageToTear.getIdUteReply() != null
                && messageToTear.getIdUteReply().equals(currentUserId);

        // In a two-message ping-pong, if messageToTear is one part, its idMsgReply
        // points to the other.
        // The user tearing should be the author of messageToTear OR the author of the
        // message it replies to (if messageToTear is a reply).
        // The original HomeRegController.strappaMsg checked if current user was
        // message.idUteAut OR message.idUteReply.
        // This implies the user can tear either their own message or a reply they
        // received.

        if (!isAuthor) { // If not the direct author of this specific message record
            // Check if they are the other participant in the conversation this message
            // belongs to
            if (messageToTear.getIdMsgReply() != null) {
                Messaggio counterpartMessage = messaggioService.findById(messageToTear.getIdMsgReply());
                if (counterpartMessage != null && counterpartMessage.getIdUteAut() != null
                        && counterpartMessage.getIdUteAut().equals(currentUserId)) {
                    // Current user is the author of the message this one replies to. They can tear.
                } else {
                    paperLogger.warn(
                            "User ID: {} is not authorized to tear message ID: {}. Not author or direct participant in reply.",
                            currentUserId, messageId);
                    return new ResponseEntity<>("{\"error\":\"You are not authorized to tear this message.\"}",
                            HttpStatus.FORBIDDEN);
                }
            } else if (!isReplier) { // Not author, not a reply to their message, and not the designated replier on
                                     // this message record
                paperLogger.warn(
                        "User ID: {} is not authorized to tear message ID: {}. Not author or designated replier.",
                        currentUserId, messageId);
                return new ResponseEntity<>("{\"error\":\"You are not authorized to tear this message.\"}",
                        HttpStatus.FORBIDDEN);
            }
        }

        // Daily limit check
        boolean isStrappaGreaterMax = utenteActionCustomService.checkNumStrappaGreaterMax(currentUserId, new Date());
        if (isStrappaGreaterMax) {
            paperLogger.warn("User ID: {} has exceeded daily tear limit.", currentUserId);
            return new ResponseEntity<>("{\"error\":\"You have reached the daily limit for tearing papers.\"}",
                    HttpStatus.FORBIDDEN);
        }

        try {
            // The service method `strappoMsg` takes (idUte, idMsg, idMsgReply of
            // messageToTear)
            boolean isError = messaggioCustomService.strappoMsg(currentUserId, messageId,
                    messageToTear.getIdMsgReply());
            if (isError) {
                paperLogger.error("Failed to tear message ID: {} for user ID: {}. Service returned error.", messageId,
                        currentUserId);
                return new ResponseEntity<>("{\"error\":\"Failed to tear message.\"}",
                        HttpStatus.INTERNAL_SERVER_ERROR);
            }

            paperLogger.info("Message ID: {} successfully torn by user ID: {}", messageId, currentUserId);
            return new ResponseEntity<>("{\"message\":\"Message successfully torn.\"}", HttpStatus.OK);
        } catch (Exception e) {
            paperLogger.error("Exception tearing message ID: {} for user ID: {}: {}", messageId, currentUserId,
                    e.getMessage(), e);
            return new ResponseEntity<>("{\"error\":\"An internal error occurred while tearing the message.\"}",
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(value = "/messages/{messageId}/report", method = RequestMethod.POST)
    public ResponseEntity<?> reportMessage(
            @PathVariable("messageId") Integer messageId,
            @RequestBody ReportMessageRequestDto reportRequest) {

        Integer currentUserId = getCurrentUserId();
        if (currentUserId == null) {
            return new ResponseEntity<>("{\"error\":\"User not authenticated.\"}", HttpStatus.UNAUTHORIZED);
        }
        paperLogger.info("User ID: {} attempting to report message ID: {} for reason: {}", currentUserId, messageId,
                reportRequest.getReason());

        if (messageId == null || UtilityFunction.isFieldBlank(reportRequest.getReason())) {
            return new ResponseEntity<>("{\"error\":\"Message ID and reason are required.\"}", HttpStatus.BAD_REQUEST);
        }

        Messaggio messageToReport = messaggioService.findById(messageId);
        if (messageToReport == null) {
            paperLogger.warn("Attempt to report non-existent message ID: {}", messageId);
            return new ResponseEntity<>("{\"error\":\"Message to report not found.\"}", HttpStatus.NOT_FOUND);
        }

        // Validation: Must be public, user cannot report their own message
        if (!ConstantsDefinition.CODMSG_PUB.equals(messageToReport.getCodTipMsg())) {
            paperLogger.warn("User ID: {} attempting to report non-public message ID: {}", currentUserId, messageId);
            return new ResponseEntity<>("{\"error\":\"Only public messages can be reported.\"}",
                    HttpStatus.BAD_REQUEST);
        }
        if (messageToReport.getIdUteAut() != null && messageToReport.getIdUteAut().equals(currentUserId)) {
            paperLogger.warn("User ID: {} attempting to report their own message ID: {}", currentUserId, messageId);
            return new ResponseEntity<>("{\"error\":\"You cannot report your own message.\"}", HttpStatus.FORBIDDEN);
        }

        try {
            MessaggioSegnalato report = messaggioSegnalatoCustomService.insertMsgSegnalato(
                    messageId,
                    reportRequest.getReason(),
                    currentUserId);

            if (report == null || report.getIdMsgSegn() == null) {
                paperLogger.error("Failed to submit report for message ID: {} by user ID: {}.", messageId,
                        currentUserId);
                return new ResponseEntity<>("{\"error\":\"Failed to submit report.\"}",
                        HttpStatus.INTERNAL_SERVER_ERROR);
            }

            paperLogger.info("Report submitted successfully for message ID: {} by user ID: {}. Report ID: {}",
                    messageId, currentUserId, report.getIdMsgSegn());
            return new ResponseEntity<>("{\"message\":\"Message reported successfully.\"}", HttpStatus.CREATED);

        } catch (Exception e) {
            paperLogger.error("Exception submitting report for message ID: {} by user ID: {}: {}", messageId,
                    currentUserId, e.getMessage(), e);
            return new ResponseEntity<>("{\"error\":\"An internal error occurred while submitting the report.\"}",
                    HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
