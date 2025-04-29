// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageReportModelImpl _$$MessageReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageReportModelImpl(
      idMsg: json['idMsg'] as String,
      desMot: json['desMot'] as String,
      idMsgSegn: (json['idMsgSegn'] as num?)?.toInt(),
      datSegn: _fromJsonTimestamp((json['datSegn'] as num?)?.toInt()),
      datUltMov: _fromJsonTimestamp((json['datUltMov'] as num?)?.toInt()),
      idUteSegn: json['idUteSegn'] as String?,
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$$MessageReportModelImplToJson(
        _$MessageReportModelImpl instance) =>
    <String, dynamic>{
      'idMsg': instance.idMsg,
      'desMot': instance.desMot,
      'idMsgSegn': instance.idMsgSegn,
      'datSegn': _toJsonTimestamp(instance.datSegn),
      'datUltMov': _toJsonTimestamp(instance.datUltMov),
      'idUteSegn': instance.idUteSegn,
      'isExpanded': instance.isExpanded,
    };
