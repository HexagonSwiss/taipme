import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/create_message_request_model/create_message_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/message_model/message_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/paper_content_model/paper_content_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/user_papers_summary_model/user_papers_summary_model.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/paper_service/paper_service.dart';

part 'paper_controller.g.dart';

@Riverpod(keepAlive: true)
class UserPapersSummarySyncController
    extends _$UserPapersSummarySyncController {
  @override
  UserPapersSummaryModel? build() => null;

  void setSummary(UserPapersSummaryModel summary) {
    state = summary;
    debugPrint(
        "UserPapersSummarySyncController: Summary updated. Papers: ${summary.papers.length}");
  }

  void clearSummary() {
    state = null;
    debugPrint("UserPapersSummarySyncController: Summary cleared.");
  }
}

@riverpod
Future<UserPapersSummaryModel> fetchUserPapersSummary(Ref ref) async {
  debugPrint(
      "fetchUserPapersSummaryProvider: Fetching user papers summary from API...");
  final paperService = ref.watch(paperServiceProvider.notifier);

  final result = await paperService.getUserPapersSummary();

  if (result.hasError() || result.data == null) {
    debugPrint(
        "fetchUserPapersSummaryProvider: Error fetching summary: ${result.error}");
    throw Exception(result.error ?? "Failed to fetch paper summary");
  }

  ref
      .read(userPapersSummarySyncControllerProvider.notifier)
      .setSummary(result.data!);
  debugPrint(
      "fetchUserPapersSummaryProvider: Summary fetched and sync state updated.");
  return result.data!;
}

@Riverpod(keepAlive: true)
class PaperContentSyncController extends _$PaperContentSyncController {
  @override
  Map<int, PaperContentModel?> build() => {};

  void setPaperContent(int paperId, PaperContentModel content) {
    state = {...state, paperId: content};
    debugPrint(
        "PaperContentSyncController: Content updated for paperId $paperId.");
  }

  void clearPaperContent(int paperId) {
    state = {...state..remove(paperId)};
    debugPrint(
        "PaperContentSyncController: Content cleared for paperId $paperId.");
  }

  void clearAllPaperContents() {
    state = {};
    debugPrint("PaperContentSyncController: All paper contents cleared.");
  }

  PaperContentModel? getContentForId(int paperId) => state[paperId];
}

@riverpod
Future<PaperContentModel> fetchPaperContent(Ref ref, int paperId) async {
  debugPrint(
      "fetchPaperContentProvider: Fetching content for paperId: $paperId from API...");
  final paperService = ref.watch(paperServiceProvider.notifier);

  final result = await paperService.getPaperContent(paperId);

  if (result.hasError() || result.data == null) {
    debugPrint(
        "fetchPaperContentProvider: Error fetching content for paperId $paperId: ${result.error}");
    throw Exception(
        result.error ?? "Failed to fetch content for paper $paperId");
  }

  ref
      .read(paperContentSyncControllerProvider.notifier)
      .setPaperContent(paperId, result.data!);
  debugPrint(
      "fetchPaperContentProvider: Content for paperId $paperId fetched and sync state updated.");
  return result.data!;
}

@riverpod
class CurrentPaperId extends _$CurrentPaperId {
  @override
  int build() => 1;

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
  }) async {
    debugPrint("PaperActionsController: createNewMessage on paper $paperId");
    final paperService = ref.read(paperServiceProvider.notifier);
    final requestModel = CreateMessageRequestModel(
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
    }
    return result; // Return the original result for the UI to handle
  }
}
