// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultModel<T> {
  T? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultModelCopyWith<T, ResultModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultModelCopyWith<T, $Res> {
  factory $ResultModelCopyWith(
          ResultModel<T> value, $Res Function(ResultModel<T>) then) =
      _$ResultModelCopyWithImpl<T, $Res, ResultModel<T>>;
  @useResult
  $Res call({T? data, String? error, int? statusCode});
}

/// @nodoc
class _$ResultModelCopyWithImpl<T, $Res, $Val extends ResultModel<T>>
    implements $ResultModelCopyWith<T, $Res> {
  _$ResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultModelImplCopyWith<T, $Res>
    implements $ResultModelCopyWith<T, $Res> {
  factory _$$ResultModelImplCopyWith(_$ResultModelImpl<T> value,
          $Res Function(_$ResultModelImpl<T>) then) =
      __$$ResultModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data, String? error, int? statusCode});
}

/// @nodoc
class __$$ResultModelImplCopyWithImpl<T, $Res>
    extends _$ResultModelCopyWithImpl<T, $Res, _$ResultModelImpl<T>>
    implements _$$ResultModelImplCopyWith<T, $Res> {
  __$$ResultModelImplCopyWithImpl(
      _$ResultModelImpl<T> _value, $Res Function(_$ResultModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$ResultModelImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ResultModelImpl<T> implements _ResultModel<T> {
  const _$ResultModelImpl({this.data, this.error, this.statusCode});

  @override
  final T? data;
  @override
  final String? error;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'ResultModel<$T>(data: $data, error: $error, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultModelImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), error, statusCode);

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultModelImplCopyWith<T, _$ResultModelImpl<T>> get copyWith =>
      __$$ResultModelImplCopyWithImpl<T, _$ResultModelImpl<T>>(
          this, _$identity);
}

abstract class _ResultModel<T> implements ResultModel<T> {
  const factory _ResultModel(
      {final T? data,
      final String? error,
      final int? statusCode}) = _$ResultModelImpl<T>;

  @override
  T? get data;
  @override
  String? get error;
  @override
  int? get statusCode;

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultModelImplCopyWith<T, _$ResultModelImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
