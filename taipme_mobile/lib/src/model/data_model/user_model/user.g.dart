// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      idUte: (json['idUte'] as num).toInt(),
      email: json['email'] as String,
      pwd: json['pwd'] as String,
      codTipPrf: $enumDecode(_$ProfileCodeEnumEnumMap, json['codTipPrf']),
      datUltMov: DateTime.parse(json['datUltMov'] as String),
      username: json['username'] as String?,
      datCreUte: json['datCreUte'] == null
          ? null
          : DateTime.parse(json['datCreUte'] as String),
      emailConf: json['emailConf'] as String?,
      pwdConf: json['pwdConf'] as String?,
      pwdNew: json['pwdNew'] as String?,
      conUid: json['conUid'] as String?,
      desTipPrf: json['desTipPrf'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'idUte': instance.idUte,
      'email': instance.email,
      'pwd': instance.pwd,
      'codTipPrf': _$ProfileCodeEnumEnumMap[instance.codTipPrf]!,
      'datUltMov': instance.datUltMov.toIso8601String(),
      'username': instance.username,
      'datCreUte': instance.datCreUte?.toIso8601String(),
      'emailConf': instance.emailConf,
      'pwdConf': instance.pwdConf,
      'pwdNew': instance.pwdNew,
      'conUid': instance.conUid,
      'desTipPrf': instance.desTipPrf,
    };

const _$ProfileCodeEnumEnumMap = {
  ProfileCodeEnum.adm: 'ADM',
  ProfileCodeEnum.any: 'ANY',
  ProfileCodeEnum.ban: 'BAN',
  ProfileCodeEnum.reg: 'REG',
};
