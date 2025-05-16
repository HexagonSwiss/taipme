import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/paper_status_model/paper_status_model.dart';

part 'user_papers_summary_model.freezed.dart';
part 'user_papers_summary_model.g.dart';

@freezed
abstract class UserPapersSummaryModel with _$UserPapersSummaryModel {
  const factory UserPapersSummaryModel({
    required List<PaperStatusModel> papers,
    required int maxPapersAllowed,
    required bool canAddNewPaper,
  }) = _UserPapersSummaryModel;

  factory UserPapersSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$UserPapersSummaryModelFromJson(json);
}