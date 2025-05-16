import 'package:freezed_annotation/freezed_annotation.dart';

part 'paper_action_flags_model.freezed.dart';
part 'paper_action_flags_model.g.dart';

@freezed
abstract class PaperActionFlagsModel with _$PaperActionFlagsModel {
  const factory PaperActionFlagsModel({
    @Default(false) bool canWriteNewOnThisPaper,
    @Default(false) bool canReplyToMainMessage,
    @Default(false) bool canReadOtherRandomMessages,
    @Default(false) bool canTearMainMessage,
    @Default(false) bool canReportMainMessage,
  }) = _PaperActionFlagsModel;

  factory PaperActionFlagsModel.fromJson(Map<String, dynamic> json) =>
      _$PaperActionFlagsModelFromJson(json);
}