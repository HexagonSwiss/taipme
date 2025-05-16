// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      idMsg: (json['idMsg'] as num).toInt(),
      desMsg: json['desMsg'] as String?,
      titMsg: json['titMsg'] as String?,
      idUteAut: (json['idUteAut'] as num?)?.toInt(),
      emailAut: json['emailAut'] as String?,
      idUteReply: (json['idUteReply'] as num?)?.toInt(),
      idMsgReply: (json['idMsgReply'] as num?)?.toInt(),
      codTipMsg: json['codTipMsg'] as String?,
      desTipMsg: json['desTipMsg'] as String?,
      datUltMov: _dateTimeFromTimestamp((json['datUltMov'] as num?)?.toInt()),
      dataPub: _dateTimeFromTimestamp((json['dataPub'] as num?)?.toInt()),
      idFoglio: (json['idFoglio'] as num).toInt(),
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'idMsg': instance.idMsg,
      'desMsg': instance.desMsg,
      'titMsg': instance.titMsg,
      'idUteAut': instance.idUteAut,
      'emailAut': instance.emailAut,
      'idUteReply': instance.idUteReply,
      'idMsgReply': instance.idMsgReply,
      'codTipMsg': instance.codTipMsg,
      'desTipMsg': instance.desTipMsg,
      'datUltMov': _dateTimeToTimestamp(instance.datUltMov),
      'dataPub': _dateTimeToTimestamp(instance.dataPub),
      'idFoglio': instance.idFoglio,
    };
