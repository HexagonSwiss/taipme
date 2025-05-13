import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taipme_mobile/src/util/enum/profile_code_enum.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int idUte,
    required String email,
    required String pwd,
    required ProfileCodeEnum codTipPrf,
    required DateTime datUltMov,
    String? username,
    DateTime? datCreUte,
    String? emailConf, // optional
    String? pwdConf, // optional
    String? pwdNew, // optional
    String? conUid, // optional
    String? desTipPrf, // optional
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}