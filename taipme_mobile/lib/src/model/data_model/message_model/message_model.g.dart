// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      idMsg: json['idMsg'] as String,
      desMsg: json['desMsg'] as String,
      idUteAut: json['idUteAut'] as String,
      idUteReply: json['idUteReply'] as String?,
      idMsgReply: json['idMsgReply'] as String?,
      dataPub: json['dataPub'] == null
          ? null
          : DateTime.parse(json['dataPub'] as String),
      datUltMov: json['datUltMov'] == null
          ? null
          : DateTime.parse(json['datUltMov'] as String),
      idFoglio: json['idFoglio'] == null
          ? null
          : DateTime.parse(json['idFoglio'] as String),
      codTipMsg:
          $enumDecodeNullable(_$MessageTypeEnumEnumMap, json['codTipMsg']) ??
              MessageTypeEnum.public,
      isCurrent: json['isCurrent'] as bool? ?? false,
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'idMsg': instance.idMsg,
      'desMsg': instance.desMsg,
      'idUteAut': instance.idUteAut,
      'idUteReply': instance.idUteReply,
      'idMsgReply': instance.idMsgReply,
      'dataPub': instance.dataPub?.toIso8601String(),
      'datUltMov': instance.datUltMov?.toIso8601String(),
      'idFoglio': instance.idFoglio?.toIso8601String(),
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
