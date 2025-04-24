// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      idMsg: (json['idMsg'] as num?)?.toInt(),
      idUteAut: (json['idUteAut'] as num?)?.toInt(),
      idUteReply: (json['idUteReply'] as num?)?.toInt(),
      idMsgReply: (json['idMsgReply'] as num?)?.toInt(),
      idFoglio: (json['idFoglio'] as num?)?.toInt(),
      desMsg: json['desMsg'] as String?,
      dataPub: _fromJsonTimestamp((json['dataPub'] as num?)?.toInt()),
      datUltMov: _fromJsonTimestamp((json['datUltMov'] as num?)?.toInt()),
      codTipMsg:
          $enumDecodeNullable(_$MessageTypeEnumEnumMap, json['codTipMsg']) ??
              MessageTypeEnum.public,
      isCurrent: json['isCurrent'] as bool? ?? false,
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'idMsg': instance.idMsg,
      'idUteAut': instance.idUteAut,
      'idUteReply': instance.idUteReply,
      'idMsgReply': instance.idMsgReply,
      'idFoglio': instance.idFoglio,
      'desMsg': instance.desMsg,
      'dataPub': _toJsonTimestamp(instance.dataPub),
      'datUltMov': _toJsonTimestamp(instance.datUltMov),
      'codTipMsg': _$MessageTypeEnumEnumMap[instance.codTipMsg]!,
      'isCurrent': instance.isCurrent,
    };

const _$MessageTypeEnumEnumMap = {
  MessageTypeEnum.draft: 'BOZ',
  MessageTypeEnum.cancelled: 'CCO',
  MessageTypeEnum.sent: 'INV',
  MessageTypeEnum.read: 'LET',
  MessageTypeEnum.private: 'PRI',
  MessageTypeEnum.public: 'PUB',
  MessageTypeEnum.torn: 'STRA',
};
