import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/create_message_request_model/create_message_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/message_model/message_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/paper_content_model/paper_content_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/papers_summary_model/papers_summary_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/reply_message_request_model/reply_message_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/report_message_request_model/report_message_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/paper_service/paper_service.dart';
import 'package:taipme_mobile/src/util/helper/snackbar/snackbar.dart';
import 'package:taipme_mobile/l10n/app_localizations.dart';

part 'paper_controller.g.dart';

@riverpod
Future<PapersSummaryModel> fetchUserPapersSummary(Ref ref) async {
  debugPrint(
    "fetchUserPapersSummaryProvider: Fetching user papers summary from API...",
  );
  final PaperService paperService = ref.watch(paperServiceProvider.notifier);
  final result = await paperService.getUserPapersSummary();

  if (result.hasError() || result.data == null) {
    debugPrint("fetchUserPapersSummaryProvider: Error: ${result.error}");
    throw Exception(result.error ?? "Failed to fetch paper summary");
  }

  debugPrint("fetchUserPapersSummaryProvider: Summary fetched.");

  return result.data!;
}

@riverpod
Future<PaperContentModel> fetchPaperContent(Ref ref, int paperId) async {
  debugPrint(
    "fetchPaperContentProvider: Fetching content for paperId: $paperId from API...",
  );
  final paperService = ref.watch(paperServiceProvider.notifier);

  final result = await paperService.getPaperContent(paperId);

  if (result.hasError() || result.data == null) {
    debugPrint(
      "fetchPaperContentProvider: Error fetching content for paperId $paperId: ${result.error}",
    );
    throw Exception(
      result.error ?? "Failed to fetch content for paper $paperId",
    );
  }

  debugPrint(
    "fetchPaperContentProvider: Content for paperId $paperId fetched.",
  );
  return result.data!;
}

@riverpod
class CurrentPaperId extends _$CurrentPaperId {
  @override
  int build(PapersSummaryModel summaryData) {
    state = 1;

    if (summaryData.papers.isEmpty) {
      debugPrint(
        "CurrentPaperId: No papers available, defaulting to paper ID 1.",
      );
      return 1;
    }

    final int selectedPaperId = state;

    final bool isSelectedPaperIdValid =
        summaryData.papers.any((p) => p.paperId == selectedPaperId) ||
            (summaryData.papers.isEmpty && selectedPaperId == 1);

    final int effectiveSelectedPaperId = isSelectedPaperIdValid
        ? selectedPaperId
        : (summaryData.papers.isNotEmpty
            ? summaryData.papers.first.paperId
            : 1);

    if (selectedPaperId != effectiveSelectedPaperId) {
      state = effectiveSelectedPaperId;
    }

    return effectiveSelectedPaperId;
  }

  void setCurrentPaperId(int paperId) {
    state = paperId;
    debugPrint("CurrentPaperId: Current paper ID updated to $paperId.");
  }
}

@riverpod
class PaperActionsController extends _$PaperActionsController {
  @override
  void build() {}

  Future<ResultModel<MessageModel>> createNewMessage({
    required int paperId,
    required String content,
    String? title,
    BuildContext? context,
  }) async {
    debugPrint("PaperActionsController: createNewMessage on paper $paperId");
    final PaperService paperService = ref.read(paperServiceProvider.notifier);
    final CreateMessageRequestModel requestModel = CreateMessageRequestModel(
      desMsg: content,
      titMsg: title,
    );

    final result = await paperService.createMessageOnPaper(
      paperId: paperId,
      messageRequest: requestModel,
    );

    if (!result.hasError() && result.data != null) {
      debugPrint(
        "PaperActionsController: Message created successfully. Refreshing paper content and summary.",
      );
      ref.refresh(fetchPaperContentProvider(paperId));
      ref.refresh(fetchUserPapersSummaryProvider);
    } else {
      debugPrint(
        "PaperActionsController: Failed to create message: ${result.error}",
      );
      if (context != null && context.mounted) {
        ref.read(snackBarProvider(
          text: AppLocalizations.of(context)!.snackbarFailedToCreateMessage,
        ));
      }
    }
    return result;
  }

  Future<ResultModel<MessageModel>> replyToExistingMessage({
    required int paperId,
    required int messageIdToReplyTo,
    required String replyContent,
    BuildContext? context,
  }) async {
    debugPrint(
      "PaperActionsController: replyToExistingMessage on paper $paperId to message $messageIdToReplyTo",
    );
    final paperService = ref.read(paperServiceProvider.notifier);
    final requestModel = ReplyMessageRequestModel(desMsg: replyContent);

    final result = await paperService.replyToMessage(
      paperId: paperId,
      messageIdToReplyTo: messageIdToReplyTo,
      replyRequest: requestModel,
    );

    if (!result.hasError() && result.data != null) {
      debugPrint(
        "PaperActionsController: Reply sent successfully. Refreshing paper content $paperId and summary.",
      );
      ref.refresh(fetchPaperContentProvider(paperId));
      ref.refresh(fetchUserPapersSummaryProvider);
    } else {
      debugPrint(
        "PaperActionsController: Failed to send reply: ${result.error}",
      );
      if (context != null && context.mounted) {
        ref.read(snackBarProvider(
          text: AppLocalizations.of(context)!.snackbarFailedToSendReply,
        ));
      }
    }
    return result;
  }

  Future<ResultModel<void>> tearMessage({
    required int messageId,
    required int paperId,
    BuildContext? context,
  }) async {
    debugPrint(
      "PaperActionsController: tearMessage called for messageId $messageId on paper $paperId",
    );
    final paperService = ref.read(paperServiceProvider.notifier);

    final result = await paperService.tearMessage(messageId: messageId);

    if (!result.hasError()) {
      debugPrint(
        "PaperActionsController: Message torn successfully. Refreshing paper content $paperId and summary.",
      );
      ref.refresh(fetchPaperContentProvider(paperId));
      ref.refresh(fetchUserPapersSummaryProvider);
    } else {
      debugPrint(
        "PaperActionsController: Failed to tear message: ${result.error}",
      );
      if (context != null && context.mounted) {
        ref.read(snackBarProvider(
          text: AppLocalizations.of(context)!.snackbarFailedToTearMessage,
        ));
      }
    }
    return result;
  }

  Future<ResultModel<void>> reportMessage({
    required int messageId,
    required int paperId,
    required String reason,
    BuildContext? context,
  }) async {
    debugPrint(
      "PaperActionsController: reportMessage called for messageId $messageId on paper $paperId with reason: $reason",
    );
    final paperService = ref.read(paperServiceProvider.notifier);

    final ReportMessageRequestModel requestModel = ReportMessageRequestModel(
      messageId: messageId,
      reason: reason,
    );

    final ResultModel<void> result =
        await paperService.reportMessage(reportRequest: requestModel);

    if (!result.hasError()) {
      debugPrint(
        "PaperActionsController: Message reported successfully. Refreshing paper content $paperId and summary.",
      );
      ref.refresh(fetchPaperContentProvider(paperId));
      ref.refresh(fetchUserPapersSummaryProvider);
    } else {
      debugPrint(
        "PaperActionsController: Failed to report message: ${result.error}",
      );
      if (context != null && context.mounted) {
        ref.read(snackBarProvider(
          text: AppLocalizations.of(context)!.snackbarFailedToReportMessage,
        ));
      }
    }

    return result;
  }
}
