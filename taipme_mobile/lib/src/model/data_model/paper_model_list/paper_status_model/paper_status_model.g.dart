// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaperStatusModel _$PaperStatusModelFromJson(Map<String, dynamic> json) =>
    _PaperStatusModel(
      paperId: (json['paperId'] as num).toInt(),
      hasReply: json['hasReply'] as bool,
      myTurnToReply: json['myTurnToReply'] as bool,
      isUserAuthoredSlot: json['isUserAuthoredSlot'] as bool,
    );

Map<String, dynamic> _$PaperStatusModelToJson(_PaperStatusModel instance) =>
    <String, dynamic>{
      'paperId': instance.paperId,
      'hasReply': instance.hasReply,
      'myTurnToReply': instance.myTurnToReply,
      'isUserAuthoredSlot': instance.isUserAuthoredSlot,
    };
