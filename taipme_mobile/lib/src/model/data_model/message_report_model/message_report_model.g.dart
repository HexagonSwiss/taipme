// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageReportModelImpl _$$MessageReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageReportModelImpl(
      idMsgSegn: (json['id_msg_segn'] as num).toInt(),
      idMsg: json['id_msg'] as String,
      desMot: json['des_mot'] as String,
      datSegn: json['dat_segn'] == null
          ? null
          : DateTime.parse(json['dat_segn'] as String),
      datUltMov: json['dat_ult_mov'] as String?,
      idUteSegn: json['id_ute_segn'] as String?,
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$$MessageReportModelImplToJson(
        _$MessageReportModelImpl instance) =>
    <String, dynamic>{
      'id_msg_segn': instance.idMsgSegn,
      'id_msg': instance.idMsg,
      'des_mot': instance.desMot,
      'dat_segn': instance.datSegn?.toIso8601String(),
      'dat_ult_mov': instance.datUltMov,
      'id_ute_segn': instance.idUteSegn,
      'isExpanded': instance.isExpanded,
    };
