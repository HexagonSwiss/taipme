// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper_action_flags_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaperActionFlagsModel _$PaperActionFlagsModelFromJson(
        Map<String, dynamic> json) =>
    _PaperActionFlagsModel(
      canWriteNewOnThisPaper: json['canWriteNewOnThisPaper'] as bool? ?? false,
      canReplyToMainMessage: json['canReplyToMainMessage'] as bool? ?? false,
      canReadOtherRandomMessages:
          json['canReadOtherRandomMessages'] as bool? ?? false,
      canTearMainMessage: json['canTearMainMessage'] as bool? ?? false,
      canReportMainMessage: json['canReportMainMessage'] as bool? ?? false,
    );

Map<String, dynamic> _$PaperActionFlagsModelToJson(
        _PaperActionFlagsModel instance) =>
    <String, dynamic>{
      'canWriteNewOnThisPaper': instance.canWriteNewOnThisPaper,
      'canReplyToMainMessage': instance.canReplyToMainMessage,
      'canReadOtherRandomMessages': instance.canReadOtherRandomMessages,
      'canTearMainMessage': instance.canTearMainMessage,
      'canReportMainMessage': instance.canReportMainMessage,
    };
