// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_login_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserLoginRequestModel _$UserLoginRequestModelFromJson(
    Map<String, dynamic> json) {
  return _UserLoginRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UserLoginRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this UserLoginRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserLoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserLoginRequestModelCopyWith<UserLoginRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginRequestModelCopyWith<$Res> {
  factory $UserLoginRequestModelCopyWith(UserLoginRequestModel value,
          $Res Function(UserLoginRequestModel) then) =
      _$UserLoginRequestModelCopyWithImpl<$Res, UserLoginRequestModel>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$UserLoginRequestModelCopyWithImpl<$Res,
        $Val extends UserLoginRequestModel>
    implements $UserLoginRequestModelCopyWith<$Res> {
  _$UserLoginRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserLoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$UserLoginRequestModelImplCopyWith<$Res>
    implements $UserLoginRequestModelCopyWith<$Res> {
  factory _$$UserLoginRequestModelImplCopyWith(
          _$UserLoginRequestModelImpl value,
          $Res Function(_$UserLoginRequestModelImpl) then) =
      __$$UserLoginRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$UserLoginRequestModelImplCopyWithImpl<$Res>
    extends _$UserLoginRequestModelCopyWithImpl<$Res,
        _$UserLoginRequestModelImpl>
    implements _$$UserLoginRequestModelImplCopyWith<$Res> {
  __$$UserLoginRequestModelImplCopyWithImpl(_$UserLoginRequestModelImpl _value,
      $Res Function(_$UserLoginRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserLoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$UserLoginRequestModelImpl(
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
class _$UserLoginRequestModelImpl implements _UserLoginRequestModel {
  const _$UserLoginRequestModelImpl(
      {required this.email, required this.password});

  factory _$UserLoginRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLoginRequestModelImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'UserLoginRequestModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoginRequestModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of UserLoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoginRequestModelImplCopyWith<_$UserLoginRequestModelImpl>
      get copyWith => __$$UserLoginRequestModelImplCopyWithImpl<
          _$UserLoginRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLoginRequestModelImplToJson(
      this,
    );
  }
}

abstract class _UserLoginRequestModel implements UserLoginRequestModel {
  const factory _UserLoginRequestModel(
      {required final String email,
      required final String password}) = _$UserLoginRequestModelImpl;

  factory _UserLoginRequestModel.fromJson(Map<String, dynamic> json) =
      _$UserLoginRequestModelImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of UserLoginRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserLoginRequestModelImplCopyWith<_$UserLoginRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
