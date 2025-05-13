// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get idUte => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get pwd => throw _privateConstructorUsedError;
  ProfileCodeEnum get codTipPrf => throw _privateConstructorUsedError;
  DateTime get datUltMov => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  DateTime? get datCreUte => throw _privateConstructorUsedError;
  String? get emailConf => throw _privateConstructorUsedError; // optional
  String? get pwdConf => throw _privateConstructorUsedError; // optional
  String? get pwdNew => throw _privateConstructorUsedError; // optional
  String? get conUid => throw _privateConstructorUsedError; // optional
  String? get desTipPrf => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int idUte,
      String email,
      String pwd,
      ProfileCodeEnum codTipPrf,
      DateTime datUltMov,
      String? username,
      DateTime? datCreUte,
      String? emailConf,
      String? pwdConf,
      String? pwdNew,
      String? conUid,
      String? desTipPrf});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUte = null,
    Object? email = null,
    Object? pwd = null,
    Object? codTipPrf = null,
    Object? datUltMov = null,
    Object? username = freezed,
    Object? datCreUte = freezed,
    Object? emailConf = freezed,
    Object? pwdConf = freezed,
    Object? pwdNew = freezed,
    Object? conUid = freezed,
    Object? desTipPrf = freezed,
  }) {
    return _then(_value.copyWith(
      idUte: null == idUte
          ? _value.idUte
          : idUte // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      pwd: null == pwd
          ? _value.pwd
          : pwd // ignore: cast_nullable_to_non_nullable
              as String,
      codTipPrf: null == codTipPrf
          ? _value.codTipPrf
          : codTipPrf // ignore: cast_nullable_to_non_nullable
              as ProfileCodeEnum,
      datUltMov: null == datUltMov
          ? _value.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      datCreUte: freezed == datCreUte
          ? _value.datCreUte
          : datCreUte // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emailConf: freezed == emailConf
          ? _value.emailConf
          : emailConf // ignore: cast_nullable_to_non_nullable
              as String?,
      pwdConf: freezed == pwdConf
          ? _value.pwdConf
          : pwdConf // ignore: cast_nullable_to_non_nullable
              as String?,
      pwdNew: freezed == pwdNew
          ? _value.pwdNew
          : pwdNew // ignore: cast_nullable_to_non_nullable
              as String?,
      conUid: freezed == conUid
          ? _value.conUid
          : conUid // ignore: cast_nullable_to_non_nullable
              as String?,
      desTipPrf: freezed == desTipPrf
          ? _value.desTipPrf
          : desTipPrf // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int idUte,
      String email,
      String pwd,
      ProfileCodeEnum codTipPrf,
      DateTime datUltMov,
      String? username,
      DateTime? datCreUte,
      String? emailConf,
      String? pwdConf,
      String? pwdNew,
      String? conUid,
      String? desTipPrf});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUte = null,
    Object? email = null,
    Object? pwd = null,
    Object? codTipPrf = null,
    Object? datUltMov = null,
    Object? username = freezed,
    Object? datCreUte = freezed,
    Object? emailConf = freezed,
    Object? pwdConf = freezed,
    Object? pwdNew = freezed,
    Object? conUid = freezed,
    Object? desTipPrf = freezed,
  }) {
    return _then(_$UserModelImpl(
      idUte: null == idUte
          ? _value.idUte
          : idUte // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      pwd: null == pwd
          ? _value.pwd
          : pwd // ignore: cast_nullable_to_non_nullable
              as String,
      codTipPrf: null == codTipPrf
          ? _value.codTipPrf
          : codTipPrf // ignore: cast_nullable_to_non_nullable
              as ProfileCodeEnum,
      datUltMov: null == datUltMov
          ? _value.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      datCreUte: freezed == datCreUte
          ? _value.datCreUte
          : datCreUte // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emailConf: freezed == emailConf
          ? _value.emailConf
          : emailConf // ignore: cast_nullable_to_non_nullable
              as String?,
      pwdConf: freezed == pwdConf
          ? _value.pwdConf
          : pwdConf // ignore: cast_nullable_to_non_nullable
              as String?,
      pwdNew: freezed == pwdNew
          ? _value.pwdNew
          : pwdNew // ignore: cast_nullable_to_non_nullable
              as String?,
      conUid: freezed == conUid
          ? _value.conUid
          : conUid // ignore: cast_nullable_to_non_nullable
              as String?,
      desTipPrf: freezed == desTipPrf
          ? _value.desTipPrf
          : desTipPrf // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.idUte,
      required this.email,
      required this.pwd,
      required this.codTipPrf,
      required this.datUltMov,
      this.username,
      this.datCreUte,
      this.emailConf,
      this.pwdConf,
      this.pwdNew,
      this.conUid,
      this.desTipPrf});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int idUte;
  @override
  final String email;
  @override
  final String pwd;
  @override
  final ProfileCodeEnum codTipPrf;
  @override
  final DateTime datUltMov;
  @override
  final String? username;
  @override
  final DateTime? datCreUte;
  @override
  final String? emailConf;
// optional
  @override
  final String? pwdConf;
// optional
  @override
  final String? pwdNew;
// optional
  @override
  final String? conUid;
// optional
  @override
  final String? desTipPrf;

  @override
  String toString() {
    return 'UserModel(idUte: $idUte, email: $email, pwd: $pwd, codTipPrf: $codTipPrf, datUltMov: $datUltMov, username: $username, datCreUte: $datCreUte, emailConf: $emailConf, pwdConf: $pwdConf, pwdNew: $pwdNew, conUid: $conUid, desTipPrf: $desTipPrf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.idUte, idUte) || other.idUte == idUte) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.pwd, pwd) || other.pwd == pwd) &&
            (identical(other.codTipPrf, codTipPrf) ||
                other.codTipPrf == codTipPrf) &&
            (identical(other.datUltMov, datUltMov) ||
                other.datUltMov == datUltMov) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.datCreUte, datCreUte) ||
                other.datCreUte == datCreUte) &&
            (identical(other.emailConf, emailConf) ||
                other.emailConf == emailConf) &&
            (identical(other.pwdConf, pwdConf) || other.pwdConf == pwdConf) &&
            (identical(other.pwdNew, pwdNew) || other.pwdNew == pwdNew) &&
            (identical(other.conUid, conUid) || other.conUid == conUid) &&
            (identical(other.desTipPrf, desTipPrf) ||
                other.desTipPrf == desTipPrf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idUte,
      email,
      pwd,
      codTipPrf,
      datUltMov,
      username,
      datCreUte,
      emailConf,
      pwdConf,
      pwdNew,
      conUid,
      desTipPrf);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final int idUte,
      required final String email,
      required final String pwd,
      required final ProfileCodeEnum codTipPrf,
      required final DateTime datUltMov,
      final String? username,
      final DateTime? datCreUte,
      final String? emailConf,
      final String? pwdConf,
      final String? pwdNew,
      final String? conUid,
      final String? desTipPrf}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int get idUte;
  @override
  String get email;
  @override
  String get pwd;
  @override
  ProfileCodeEnum get codTipPrf;
  @override
  DateTime get datUltMov;
  @override
  String? get username;
  @override
  DateTime? get datCreUte;
  @override
  String? get emailConf; // optional
  @override
  String? get pwdConf; // optional
  @override
  String? get pwdNew; // optional
  @override
  String? get conUid; // optional
  @override
  String? get desTipPrf;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
