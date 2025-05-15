// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRegisterResponseModel _$UserRegisterResponseModelFromJson(
        Map<String, dynamic> json) =>
    _UserRegisterResponseModel(
      message: json['message'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$UserRegisterResponseModelToJson(
        _UserRegisterResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
    };
