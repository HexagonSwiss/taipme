// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaperContentModel _$PaperContentModelFromJson(Map<String, dynamic> json) =>
    _PaperContentModel(
      mainMessage: json['mainMessage'] == null
          ? null
          : MessageModel.fromJson(json['mainMessage'] as Map<String, dynamic>),
      actionFlags: PaperActionFlagsModel.fromJson(
          json['actionFlags'] as Map<String, dynamic>),
      currentPaperId: (json['currentPaperId'] as num).toInt(),
      paperTitle: json['paperTitle'] as String?,
    );

Map<String, dynamic> _$PaperContentModelToJson(_PaperContentModel instance) =>
    <String, dynamic>{
      'mainMessage': instance.mainMessage?.toJson(),
      'actionFlags': instance.actionFlags.toJson(),
      'currentPaperId': instance.currentPaperId,
      'paperTitle': instance.paperTitle,
    };
