// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageReportModelImpl _$$MessageReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageReportModelImpl(
      idMsgSegn: (json['idMsgSegn'] as num).toInt(),
      idMsg: json['idMsg'] as String,
      desMot: json['desMot'] as String,
      datSegn: json['datSegn'] == null
          ? null
          : DateTime.parse(json['datSegn'] as String),
      datUltMov: json['datUltMov'] as String?,
      idUteSegn: json['idUteSegn'] as String?,
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$$MessageReportModelImplToJson(
        _$MessageReportModelImpl instance) =>
    <String, dynamic>{
      'idMsgSegn': instance.idMsgSegn,
      'idMsg': instance.idMsg,
      'desMot': instance.desMot,
      'datSegn': instance.datSegn?.toIso8601String(),
      'datUltMov': instance.datUltMov,
      'idUteSegn': instance.idUteSegn,
      'isExpanded': instance.isExpanded,
    };
