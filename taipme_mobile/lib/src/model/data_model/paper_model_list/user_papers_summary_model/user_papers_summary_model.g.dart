// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_papers_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPapersSummaryModel _$UserPapersSummaryModelFromJson(
        Map<String, dynamic> json) =>
    _UserPapersSummaryModel(
      papers: (json['papers'] as List<dynamic>)
          .map((e) => PaperStatusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxPapersAllowed: (json['maxPapersAllowed'] as num).toInt(),
      canAddNewPaper: json['canAddNewPaper'] as bool,
    );

Map<String, dynamic> _$UserPapersSummaryModelToJson(
        _UserPapersSummaryModel instance) =>
    <String, dynamic>{
      'papers': instance.papers.map((e) => e.toJson()).toList(),
      'maxPapersAllowed': instance.maxPapersAllowed,
      'canAddNewPaper': instance.canAddNewPaper,
    };
