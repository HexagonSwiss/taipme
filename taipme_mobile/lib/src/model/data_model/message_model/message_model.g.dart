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
      titMsg: json['titMsg'] as String?,
      emailAut: json['emailAut'] as String?,
      dataPub: _fromJsonTimestamp((json['dataPub'] as num?)?.toInt()),
      datUltMov: _fromJsonTimestamp((json['datUltMov'] as num?)?.toInt()),
      codTipMsg:
          $enumDecodeNullable(_$MessageTypeEnumEnumMap, json['codTipMsg']) ??
              MessageTypeEnum.public,
      desTipMsg: json['desTipMsg'] as String?,
      tipMsgPub: json['tipMsgPub'] as bool?,
      tipMsgPri: json['tipMsgPri'] as bool?,
      datUltMovView: json['datUltMovView'] as String?,
      idFoglioOrig: (json['idFoglioOrig'] as num?)?.toInt(),
      segnala: json['segnala'] as bool?,
      presenteRisposta: json['presenteRisposta'] as bool?,
      hashtag: json['hashtag'] as String?,
      desErrHashTag: json['desErrHashTag'] as String?,
      desSuccessHashTag: json['desSuccessHashTag'] as String?,
      desMot: json['desMot'] as String?,
      offensivo: json['offensivo'] as bool?,
      msgUteReg: json['msgUteReg'] as bool?,
      foundMsgPubRandom: json['foundMsgPubRandom'] as bool?,
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
      'titMsg': instance.titMsg,
      'emailAut': instance.emailAut,
      'dataPub': _toJsonTimestamp(instance.dataPub),
      'datUltMov': _toJsonTimestamp(instance.datUltMov),
      'codTipMsg': _$MessageTypeEnumEnumMap[instance.codTipMsg]!,
      'desTipMsg': instance.desTipMsg,
      'tipMsgPub': instance.tipMsgPub,
      'tipMsgPri': instance.tipMsgPri,
      'datUltMovView': instance.datUltMovView,
      'idFoglioOrig': instance.idFoglioOrig,
      'segnala': instance.segnala,
      'presenteRisposta': instance.presenteRisposta,
      'hashtag': instance.hashtag,
      'desErrHashTag': instance.desErrHashTag,
      'desSuccessHashTag': instance.desSuccessHashTag,
      'desMot': instance.desMot,
      'offensivo': instance.offensivo,
      'msgUteReg': instance.msgUteReg,
      'foundMsgPubRandom': instance.foundMsgPubRandom,
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
