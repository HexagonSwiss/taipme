// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FaqModel _$FaqModelFromJson(Map<String, dynamic> json) {
  return _FaqModel.fromJson(json);
}

/// @nodoc
mixin _$FaqModel {
  int get idFaq => throw _privateConstructorUsedError;
  String get domFaq => throw _privateConstructorUsedError;
  String get risFaq => throw _privateConstructorUsedError;
  DateTime? get datFaq => throw _privateConstructorUsedError;
  String? get codStaFaq => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;

  /// Serializes this FaqModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqModelCopyWith<FaqModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqModelCopyWith<$Res> {
  factory $FaqModelCopyWith(FaqModel value, $Res Function(FaqModel) then) =
      _$FaqModelCopyWithImpl<$Res, FaqModel>;
  @useResult
  $Res call(
      {int idFaq,
      String domFaq,
      String risFaq,
      DateTime? datFaq,
      String? codStaFaq,
      bool isExpanded});
}

/// @nodoc
class _$FaqModelCopyWithImpl<$Res, $Val extends FaqModel>
    implements $FaqModelCopyWith<$Res> {
  _$FaqModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idFaq = null,
    Object? domFaq = null,
    Object? risFaq = null,
    Object? datFaq = freezed,
    Object? codStaFaq = freezed,
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      idFaq: null == idFaq
          ? _value.idFaq
          : idFaq // ignore: cast_nullable_to_non_nullable
              as int,
      domFaq: null == domFaq
          ? _value.domFaq
          : domFaq // ignore: cast_nullable_to_non_nullable
              as String,
      risFaq: null == risFaq
          ? _value.risFaq
          : risFaq // ignore: cast_nullable_to_non_nullable
              as String,
      datFaq: freezed == datFaq
          ? _value.datFaq
          : datFaq // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codStaFaq: freezed == codStaFaq
          ? _value.codStaFaq
          : codStaFaq // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FaqModelImplCopyWith<$Res>
    implements $FaqModelCopyWith<$Res> {
  factory _$$FaqModelImplCopyWith(
          _$FaqModelImpl value, $Res Function(_$FaqModelImpl) then) =
      __$$FaqModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int idFaq,
      String domFaq,
      String risFaq,
      DateTime? datFaq,
      String? codStaFaq,
      bool isExpanded});
}

/// @nodoc
class __$$FaqModelImplCopyWithImpl<$Res>
    extends _$FaqModelCopyWithImpl<$Res, _$FaqModelImpl>
    implements _$$FaqModelImplCopyWith<$Res> {
  __$$FaqModelImplCopyWithImpl(
      _$FaqModelImpl _value, $Res Function(_$FaqModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FaqModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idFaq = null,
    Object? domFaq = null,
    Object? risFaq = null,
    Object? datFaq = freezed,
    Object? codStaFaq = freezed,
    Object? isExpanded = null,
  }) {
    return _then(_$FaqModelImpl(
      idFaq: null == idFaq
          ? _value.idFaq
          : idFaq // ignore: cast_nullable_to_non_nullable
              as int,
      domFaq: null == domFaq
          ? _value.domFaq
          : domFaq // ignore: cast_nullable_to_non_nullable
              as String,
      risFaq: null == risFaq
          ? _value.risFaq
          : risFaq // ignore: cast_nullable_to_non_nullable
              as String,
      datFaq: freezed == datFaq
          ? _value.datFaq
          : datFaq // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codStaFaq: freezed == codStaFaq
          ? _value.codStaFaq
          : codStaFaq // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqModelImpl implements _FaqModel {
  const _$FaqModelImpl(
      {required this.idFaq,
      required this.domFaq,
      required this.risFaq,
      this.datFaq,
      this.codStaFaq,
      this.isExpanded = false});

  factory _$FaqModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqModelImplFromJson(json);

  @override
  final int idFaq;
  @override
  final String domFaq;
  @override
  final String risFaq;
  @override
  final DateTime? datFaq;
  @override
  final String? codStaFaq;
  @override
  @JsonKey()
  final bool isExpanded;

  @override
  String toString() {
    return 'FaqModel(idFaq: $idFaq, domFaq: $domFaq, risFaq: $risFaq, datFaq: $datFaq, codStaFaq: $codStaFaq, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqModelImpl &&
            (identical(other.idFaq, idFaq) || other.idFaq == idFaq) &&
            (identical(other.domFaq, domFaq) || other.domFaq == domFaq) &&
            (identical(other.risFaq, risFaq) || other.risFaq == risFaq) &&
            (identical(other.datFaq, datFaq) || other.datFaq == datFaq) &&
            (identical(other.codStaFaq, codStaFaq) ||
                other.codStaFaq == codStaFaq) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, idFaq, domFaq, risFaq, datFaq, codStaFaq, isExpanded);

  /// Create a copy of FaqModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqModelImplCopyWith<_$FaqModelImpl> get copyWith =>
      __$$FaqModelImplCopyWithImpl<_$FaqModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqModelImplToJson(
      this,
    );
  }
}

abstract class _FaqModel implements FaqModel {
  const factory _FaqModel(
      {required final int idFaq,
      required final String domFaq,
      required final String risFaq,
      final DateTime? datFaq,
      final String? codStaFaq,
      final bool isExpanded}) = _$FaqModelImpl;

  factory _FaqModel.fromJson(Map<String, dynamic> json) =
      _$FaqModelImpl.fromJson;

  @override
  int get idFaq;
  @override
  String get domFaq;
  @override
  String get risFaq;
  @override
  DateTime? get datFaq;
  @override
  String? get codStaFaq;
  @override
  bool get isExpanded;

  /// Create a copy of FaqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqModelImplCopyWith<_$FaqModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
