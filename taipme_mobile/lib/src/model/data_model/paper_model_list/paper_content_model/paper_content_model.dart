import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/message_model/message_model.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/paper_action_flags_model/paper_action_flags_model.dart';

part 'paper_content_model.freezed.dart';
part 'paper_content_model.g.dart';

@freezed
abstract class PaperContentModel with _$PaperContentModel {
  const factory PaperContentModel({
    MessageModel? mainMessage, 
    required PaperActionFlagsModel actionFlags,
    required int currentPaperId,
    String? paperTitle,
  }) = _PaperContentModel;

  factory PaperContentModel.fromJson(Map<String, dynamic> json) =>
      _$PaperContentModelFromJson(json);
}