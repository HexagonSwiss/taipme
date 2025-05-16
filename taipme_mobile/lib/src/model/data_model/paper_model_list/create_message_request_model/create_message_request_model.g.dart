// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_message_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateMessageRequestModel _$CreateMessageRequestModelFromJson(
        Map<String, dynamic> json) =>
    _CreateMessageRequestModel(
      desMsg: json['desMsg'] as String,
      titMsg: json['titMsg'] as String?,
    );

Map<String, dynamic> _$CreateMessageRequestModelToJson(
        _CreateMessageRequestModel instance) =>
    <String, dynamic>{
      'desMsg': instance.desMsg,
      'titMsg': instance.titMsg,
    };
