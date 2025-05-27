import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taipme_mobile/src/model/data_model/paper_model_list/paper_status_model/paper_status_model.dart';

part 'papers_summary_model.freezed.dart';
part 'papers_summary_model.g.dart';

@freezed
abstract class PapersSummaryModel with _$PapersSummaryModel {
  const factory PapersSummaryModel({
    required List<PaperStatusModel> papers,
    required bool canAddNewPaper,
  }) = _PapersSummaryModel;

  factory PapersSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$PapersSummaryModelFromJson(json);
}