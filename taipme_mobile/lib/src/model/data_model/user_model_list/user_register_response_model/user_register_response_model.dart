import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_response_model.freezed.dart';
part 'user_register_response_model.g.dart';

@freezed
abstract class UserRegisterResponseModel with _$UserRegisterResponseModel {
  const factory UserRegisterResponseModel({
    String? message,
    String? error,
  }) = _UserRegisterResponseModel;

  factory UserRegisterResponseModel.fromJson(Map<String, Object?> json) => _$UserRegisterResponseModelFromJson(json);
}