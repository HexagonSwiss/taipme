// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_message_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportMessageRequestModel _$ReportMessageRequestModelFromJson(
        Map<String, dynamic> json) =>
    _ReportMessageRequestModel(
      messageId: (json['messageId'] as num).toInt(),
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$ReportMessageRequestModelToJson(
        _ReportMessageRequestModel instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'reason': instance.reason,
    };
