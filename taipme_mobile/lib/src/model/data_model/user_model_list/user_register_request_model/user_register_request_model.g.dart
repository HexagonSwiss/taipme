// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRegisterRequestModel _$UserRegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    _UserRegisterRequestModel(
      userName: json['userName'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserRegisterRequestModelToJson(
        _UserRegisterRequestModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
    };
