import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/create_message_request_model/create_message_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/message_model/message_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/paper_content_model/paper_content_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/papers_summary_model/papers_summary_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/reply_message_request_model/reply_message_request_model.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/service/storage_service/storage_service.dart';
import 'package:taipme_mobile/src/util/helper/request_builder/request_builder.dart';

part 'paper_service.g.dart';

@riverpod
class PaperService extends _$PaperService {
  @override
  void build() {}

  Future<ResultModel<PapersSummaryModel>> getUserPapersSummary() async {
    debugPrint("PaperService: getUserPapersSummary called");

    final tokenResult =
        await ref.read(storageServiceProvider.notifier).getToken();

    if (tokenResult.hasError() || tokenResult.data == null) {
      debugPrint(
        "PaperService: No token for getUserPapersSummary. Error: ${tokenResult.error}",
      );
      return ResultModel(error: "User not authenticated.", statusCode: 401);
    }

    final String token = tokenResult.data!;

    final response =
        await ref.read(requestBuilderProvider.notifier).get<PapersSummaryModel>(
              endpoint: "/papers/status",
              token: token,
              parser: (json) {
                if (json is Map<String, dynamic>) {
                  return PapersSummaryModel.fromJson(json);
                }
                throw FormatException(
                  "Expected a Map for UserPapersSummary, got ${json.runtimeType}",
                );
              },
            );

    if (response.hasError() || response.data == null) {
      debugPrint(
        "PaperService: getUserPapersSummary failed. Error: ${response.error}, Status: ${response.statusCode}",
      );
      return ResultModel(
        error: response.error ?? "Failed to load paper summary.",
        statusCode: response.statusCode,
      );
    }

    debugPrint(
      "PaperService: Successfully fetched paper summary. Papers count: ${response.data!.papers.length}",
    );

    return response;
  }

  Future<ResultModel<PaperContentModel>> getPaperContent(int paperId) async {
    debugPrint("PaperService: getPaperContent called for paperId: $paperId");

    final tokenResult =
        await ref.read(storageServiceProvider.notifier).getToken();
    if (tokenResult.hasError() || tokenResult.data == null) {
      debugPrint(
        "PaperService: No token for getPaperContent. Error: ${tokenResult.error}",
      );
      return ResultModel(error: "User not authenticated.", statusCode: 401);
    }
    final String token = tokenResult.data!;

    final response =
        await ref.read(requestBuilderProvider.notifier).get<PaperContentModel>(
              endpoint: "/papers/$paperId",
              token: token,
              parser: (json) {
                if (json is Map<String, dynamic>) {
                  return PaperContentModel.fromJson(json);
                }
                throw FormatException(
                  "Expected a Map for PaperContent, got ${json.runtimeType}",
                );
              },
            );

    if (response.hasError() || response.data == null) {
      debugPrint(
        "PaperService: getPaperContent for paperId $paperId failed. Error: ${response.error}, Status: ${response.statusCode}",
      );
      return ResultModel(
        error: response.error ?? "Failed to load paper content.",
        statusCode: response.statusCode,
      );
    }

    debugPrint(
      "PaperService: Successfully fetched content for paperId $paperId. Title: ${response.data!.paperTitle}",
    );
    return response;
  }

  Future<ResultModel<MessageModel>> createMessageOnPaper({
    required int paperId,
    required CreateMessageRequestModel messageRequest,
  }) async {
    debugPrint(
        "PaperService: createMessageOnPaper called for paperId: $paperId with content: ${messageRequest.desMsg}");

    final tokenResult =
        await ref.read(storageServiceProvider.notifier).getToken();
    if (tokenResult.hasError() || tokenResult.data == null) {
      debugPrint(
          "PaperService: No token for createMessageOnPaper. Error: ${tokenResult.error}");
      return ResultModel(error: "User not authenticated.", statusCode: 401);
    }
    final String token = tokenResult.data!;

    final response = await ref
        .read(requestBuilderProvider.notifier)
        .post<MessageModel>(
          endpoint:
              "/papers/$paperId/messages", // POST to /mobile/papers/{paperId}/messages
          body: messageRequest.toJson(), // CreateMessageRequestModel.toJson()
          token: token,
          parser: (json) {
            if (json is Map<String, dynamic>) {
              return MessageModel.fromJson(json);
            }
            throw FormatException(
                "Expected a Map for the created Message, got ${json.runtimeType}");
          },
        );

    if (response.hasError() || response.data == null) {
      debugPrint(
          "PaperService: createMessageOnPaper for paperId $paperId failed. Error: ${response.error}, Status: ${response.statusCode}");
      return ResultModel(
          error: response.error ?? "Failed to create message.",
          statusCode: response.statusCode);
    }

    debugPrint(
        "PaperService: Successfully created message on paperId $paperId. Message ID: ${response.data!.idMsg}");
    return response;
  }

  Future<ResultModel<MessageModel>> replyToMessage({
    required int paperId,
    required int messageIdToReplyTo,
    required ReplyMessageRequestModel replyRequest,
  }) async {
    debugPrint(
        "PaperService: replyToMessage called for paperId: $paperId, messageIdToReplyTo: $messageIdToReplyTo");

    final tokenResult =
        await ref.read(storageServiceProvider.notifier).getToken();
    if (tokenResult.hasError() || tokenResult.data == null) {
      debugPrint(
          "PaperService: No token for replyToMessage. Error: ${tokenResult.error}");
      return ResultModel(error: "User not authenticated.", statusCode: 401);
    }
    final String token = tokenResult.data!;

    final response =
        await ref.read(requestBuilderProvider.notifier).post<MessageModel>(
              endpoint: "/papers/$paperId/messages/$messageIdToReplyTo/reply",
              body: replyRequest.toJson(), // ReplyMessageRequestModel.toJson()
              token: token,
              parser: (json) {
                // Backend returns the created reply (Messaggio object) on success (201 Created)
                if (json is Map<String, dynamic>) {
                  return MessageModel.fromJson(json);
                }
                throw FormatException(
                    "Expected a Map for the created Reply Message, got ${json.runtimeType}");
              },
            );

    if (response.hasError() || response.data == null) {
      debugPrint(
          "PaperService: replyToMessage for paperId $paperId, messageId $messageIdToReplyTo failed. Error: ${response.error}, Status: ${response.statusCode}");
      return ResultModel(
          error: response.error ?? "Failed to send reply.",
          statusCode: response.statusCode);
    }

    debugPrint(
        "PaperService: Successfully sent reply on paperId $paperId to messageId $messageIdToReplyTo. Reply ID: ${response.data!.idMsg}");
    return response;
  }

  Future<ResultModel<void>> tearMessage({
    required int messageId,
  }) async {
    debugPrint("PaperService: tearMessage called for messageId: $messageId");

    final tokenResult =
        await ref.read(storageServiceProvider.notifier).getToken();

    if (tokenResult.hasError() || tokenResult.data == null) {
      debugPrint(
        "PaperService: No token for tearMessage. Error: ${tokenResult.error}",
      );
      return ResultModel(error: "User not authenticated.", statusCode: 401);
    }
    final String token = tokenResult.data!;

    final response = await ref.read(requestBuilderProvider.notifier).post<void>(
          endpoint: "/papers/messages/$messageId/tear",
          token: token,
          parser: (_) {},
        );

    if (response.hasError()) {
      debugPrint(
        "PaperService: tearMessage failed for messageId $messageId. Error: ${response.error}, Status: ${response.statusCode}",
      );
      return ResultModel(
        error: response.error ?? "Failed to tear message.",
        statusCode: response.statusCode,
      );
    }

    debugPrint("PaperService: Successfully tore message with ID: $messageId");
    return const ResultModel(data: null);
  }
}
