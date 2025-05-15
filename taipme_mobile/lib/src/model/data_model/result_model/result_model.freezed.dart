// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResultModel<T> {
  T? get data;
  String? get error;
  int? get statusCode;

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResultModelCopyWith<T, ResultModel<T>> get copyWith =>
      _$ResultModelCopyWithImpl<T, ResultModel<T>>(
          this as ResultModel<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResultModel<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), error, statusCode);

  @override
  String toString() {
    return 'ResultModel<$T>(data: $data, error: $error, statusCode: $statusCode)';
  }
}

/// @nodoc
abstract mixin class $ResultModelCopyWith<T, $Res> {
  factory $ResultModelCopyWith(
          ResultModel<T> value, $Res Function(ResultModel<T>) _then) =
      _$ResultModelCopyWithImpl;
  @useResult
  $Res call({T? data, String? error, int? statusCode});
}

/// @nodoc
class _$ResultModelCopyWithImpl<T, $Res>
    implements $ResultModelCopyWith<T, $Res> {
  _$ResultModelCopyWithImpl(this._self, this._then);

  final ResultModel<T> _self;
  final $Res Function(ResultModel<T>) _then;

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _ResultModel<T> extends ResultModel<T> {
  const _ResultModel({this.data, this.error, this.statusCode}) : super._();

  @override
  final T? data;
  @override
  final String? error;
  @override
  final int? statusCode;

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResultModelCopyWith<T, _ResultModel<T>> get copyWith =>
      __$ResultModelCopyWithImpl<T, _ResultModel<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResultModel<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), error, statusCode);

  @override
  String toString() {
    return 'ResultModel<$T>(data: $data, error: $error, statusCode: $statusCode)';
  }
}

/// @nodoc
abstract mixin class _$ResultModelCopyWith<T, $Res>
    implements $ResultModelCopyWith<T, $Res> {
  factory _$ResultModelCopyWith(
          _ResultModel<T> value, $Res Function(_ResultModel<T>) _then) =
      __$ResultModelCopyWithImpl;
  @override
  @useResult
  $Res call({T? data, String? error, int? statusCode});
}

/// @nodoc
class __$ResultModelCopyWithImpl<T, $Res>
    implements _$ResultModelCopyWith<T, $Res> {
  __$ResultModelCopyWithImpl(this._self, this._then);

  final _ResultModel<T> _self;
  final $Res Function(_ResultModel<T>) _then;

  /// Create a copy of ResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_ResultModel<T>(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
