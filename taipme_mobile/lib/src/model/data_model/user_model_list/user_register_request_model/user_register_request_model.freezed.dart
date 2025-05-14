// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRegisterRequestModel _$UserRegisterRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UserRegisterRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UserRegisterRequestModel {
  String? get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this UserRegisterRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRegisterRequestModelCopyWith<UserRegisterRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterRequestModelCopyWith<$Res> {
  factory $UserRegisterRequestModelCopyWith(UserRegisterRequestModel value,
          $Res Function(UserRegisterRequestModel) then) =
      _$UserRegisterRequestModelCopyWithImpl<$Res, UserRegisterRequestModel>;
  @useResult
  $Res call({String? userName, String email, String password});
}

/// @nodoc
class _$UserRegisterRequestModelCopyWithImpl<$Res,
        $Val extends UserRegisterRequestModel>
    implements $UserRegisterRequestModelCopyWith<$Res> {
  _$UserRegisterRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRegisterRequestModelImplCopyWith<$Res>
    implements $UserRegisterRequestModelCopyWith<$Res> {
  factory _$$UserRegisterRequestModelImplCopyWith(
          _$UserRegisterRequestModelImpl value,
          $Res Function(_$UserRegisterRequestModelImpl) then) =
      __$$UserRegisterRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userName, String email, String password});
}

/// @nodoc
class __$$UserRegisterRequestModelImplCopyWithImpl<$Res>
    extends _$UserRegisterRequestModelCopyWithImpl<$Res,
        _$UserRegisterRequestModelImpl>
    implements _$$UserRegisterRequestModelImplCopyWith<$Res> {
  __$$UserRegisterRequestModelImplCopyWithImpl(
      _$UserRegisterRequestModelImpl _value,
      $Res Function(_$UserRegisterRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$UserRegisterRequestModelImpl(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegisterRequestModelImpl implements _UserRegisterRequestModel {
  const _$UserRegisterRequestModelImpl(
      {this.userName, required this.email, required this.password});

  factory _$UserRegisterRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegisterRequestModelImplFromJson(json);

  @override
  final String? userName;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'UserRegisterRequestModel(userName: $userName, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterRequestModelImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userName, email, password);

  /// Create a copy of UserRegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterRequestModelImplCopyWith<_$UserRegisterRequestModelImpl>
      get copyWith => __$$UserRegisterRequestModelImplCopyWithImpl<
          _$UserRegisterRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegisterRequestModelImplToJson(
      this,
    );
  }
}

abstract class _UserRegisterRequestModel implements UserRegisterRequestModel {
  const factory _UserRegisterRequestModel(
      {final String? userName,
      required final String email,
      required final String password}) = _$UserRegisterRequestModelImpl;

  factory _UserRegisterRequestModel.fromJson(Map<String, dynamic> json) =
      _$UserRegisterRequestModelImpl.fromJson;

  @override
  String? get userName;
  @override
  String get email;
  @override
  String get password;

  /// Create a copy of UserRegisterRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRegisterRequestModelImplCopyWith<_$UserRegisterRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
