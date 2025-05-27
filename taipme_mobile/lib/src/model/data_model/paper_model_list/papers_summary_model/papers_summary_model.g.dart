// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'papers_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PapersSummaryModel _$PapersSummaryModelFromJson(Map<String, dynamic> json) =>
    _PapersSummaryModel(
      papers: (json['papers'] as List<dynamic>)
          .map((e) => PaperStatusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      canAddNewPaper: json['canAddNewPaper'] as bool,
    );

Map<String, dynamic> _$PapersSummaryModelToJson(_PapersSummaryModel instance) =>
    <String, dynamic>{
      'papers': instance.papers.map((e) => e.toJson()).toList(),
      'canAddNewPaper': instance.canAddNewPaper,
    };
