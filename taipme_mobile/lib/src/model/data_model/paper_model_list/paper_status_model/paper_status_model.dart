import 'package:freezed_annotation/freezed_annotation.dart';

part 'paper_status_model.freezed.dart';
part 'paper_status_model.g.dart';

@freezed
abstract class PaperStatusModel with _$PaperStatusModel {
  const factory PaperStatusModel({
    required int paperId,
    required bool hasReply,
    required bool myTurnToReply,
  }) = _PaperStatusModel;

  factory PaperStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PaperStatusModelFromJson(json);
}