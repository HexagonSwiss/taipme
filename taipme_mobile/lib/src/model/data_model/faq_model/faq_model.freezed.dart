// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FaqModel {
  int get idFaq;
  String get domFaq;
  String get risFaq;
  DateTime? get datFaq;
  String? get codStaFaq;
  bool get isExpanded;

  /// Create a copy of FaqModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FaqModelCopyWith<FaqModel> get copyWith =>
      _$FaqModelCopyWithImpl<FaqModel>(this as FaqModel, _$identity);

  /// Serializes this FaqModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FaqModel &&
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

  @override
  String toString() {
    return 'FaqModel(idFaq: $idFaq, domFaq: $domFaq, risFaq: $risFaq, datFaq: $datFaq, codStaFaq: $codStaFaq, isExpanded: $isExpanded)';
  }
}

/// @nodoc
abstract mixin class $FaqModelCopyWith<$Res> {
  factory $FaqModelCopyWith(FaqModel value, $Res Function(FaqModel) _then) =
      _$FaqModelCopyWithImpl;
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
class _$FaqModelCopyWithImpl<$Res> implements $FaqModelCopyWith<$Res> {
  _$FaqModelCopyWithImpl(this._self, this._then);

  final FaqModel _self;
  final $Res Function(FaqModel) _then;

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
    return _then(_self.copyWith(
      idFaq: null == idFaq
          ? _self.idFaq
          : idFaq // ignore: cast_nullable_to_non_nullable
              as int,
      domFaq: null == domFaq
          ? _self.domFaq
          : domFaq // ignore: cast_nullable_to_non_nullable
              as String,
      risFaq: null == risFaq
          ? _self.risFaq
          : risFaq // ignore: cast_nullable_to_non_nullable
              as String,
      datFaq: freezed == datFaq
          ? _self.datFaq
          : datFaq // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codStaFaq: freezed == codStaFaq
          ? _self.codStaFaq
          : codStaFaq // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FaqModel implements FaqModel {
  const _FaqModel(
      {required this.idFaq,
      required this.domFaq,
      required this.risFaq,
      this.datFaq,
      this.codStaFaq,
      this.isExpanded = false});
  factory _FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

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

  /// Create a copy of FaqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FaqModelCopyWith<_FaqModel> get copyWith =>
      __$FaqModelCopyWithImpl<_FaqModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FaqModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FaqModel &&
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

  @override
  String toString() {
    return 'FaqModel(idFaq: $idFaq, domFaq: $domFaq, risFaq: $risFaq, datFaq: $datFaq, codStaFaq: $codStaFaq, isExpanded: $isExpanded)';
  }
}

/// @nodoc
abstract mixin class _$FaqModelCopyWith<$Res>
    implements $FaqModelCopyWith<$Res> {
  factory _$FaqModelCopyWith(_FaqModel value, $Res Function(_FaqModel) _then) =
      __$FaqModelCopyWithImpl;
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
class __$FaqModelCopyWithImpl<$Res> implements _$FaqModelCopyWith<$Res> {
  __$FaqModelCopyWithImpl(this._self, this._then);

  final _FaqModel _self;
  final $Res Function(_FaqModel) _then;

  /// Create a copy of FaqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idFaq = null,
    Object? domFaq = null,
    Object? risFaq = null,
    Object? datFaq = freezed,
    Object? codStaFaq = freezed,
    Object? isExpanded = null,
  }) {
    return _then(_FaqModel(
      idFaq: null == idFaq
          ? _self.idFaq
          : idFaq // ignore: cast_nullable_to_non_nullable
              as int,
      domFaq: null == domFaq
          ? _self.domFaq
          : domFaq // ignore: cast_nullable_to_non_nullable
              as String,
      risFaq: null == risFaq
          ? _self.risFaq
          : risFaq // ignore: cast_nullable_to_non_nullable
              as String,
      datFaq: freezed == datFaq
          ? _self.datFaq
          : datFaq // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codStaFaq: freezed == codStaFaq
          ? _self.codStaFaq
          : codStaFaq // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpanded: null == isExpanded
          ? _self.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
