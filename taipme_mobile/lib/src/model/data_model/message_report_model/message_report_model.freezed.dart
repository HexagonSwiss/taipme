// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageReportModel _$MessageReportModelFromJson(Map<String, dynamic> json) {
  return _MessageReportModel.fromJson(json);
}

/// @nodoc
mixin _$MessageReportModel {
  @JsonKey(name: "id_msg_segn")
  int get idMsgSegn => throw _privateConstructorUsedError;
  @JsonKey(name: "id_msg")
  String get idMsg => throw _privateConstructorUsedError;
  @JsonKey(name: "des_mot")
  String get desMot => throw _privateConstructorUsedError;
  @JsonKey(name: "dat_segn")
  DateTime? get datSegn => throw _privateConstructorUsedError;
  @JsonKey(name: "dat_ult_mov")
  String? get datUltMov => throw _privateConstructorUsedError;
  @JsonKey(name: "id_ute_segn")
  String? get idUteSegn => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;

  /// Serializes this MessageReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageReportModelCopyWith<MessageReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageReportModelCopyWith<$Res> {
  factory $MessageReportModelCopyWith(
          MessageReportModel value, $Res Function(MessageReportModel) then) =
      _$MessageReportModelCopyWithImpl<$Res, MessageReportModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id_msg_segn") int idMsgSegn,
      @JsonKey(name: "id_msg") String idMsg,
      @JsonKey(name: "des_mot") String desMot,
      @JsonKey(name: "dat_segn") DateTime? datSegn,
      @JsonKey(name: "dat_ult_mov") String? datUltMov,
      @JsonKey(name: "id_ute_segn") String? idUteSegn,
      bool isExpanded});
}

/// @nodoc
class _$MessageReportModelCopyWithImpl<$Res, $Val extends MessageReportModel>
    implements $MessageReportModelCopyWith<$Res> {
  _$MessageReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMsgSegn = null,
    Object? idMsg = null,
    Object? desMot = null,
    Object? datSegn = freezed,
    Object? datUltMov = freezed,
    Object? idUteSegn = freezed,
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      idMsgSegn: null == idMsgSegn
          ? _value.idMsgSegn
          : idMsgSegn // ignore: cast_nullable_to_non_nullable
              as int,
      idMsg: null == idMsg
          ? _value.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as String,
      desMot: null == desMot
          ? _value.desMot
          : desMot // ignore: cast_nullable_to_non_nullable
              as String,
      datSegn: freezed == datSegn
          ? _value.datSegn
          : datSegn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datUltMov: freezed == datUltMov
          ? _value.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as String?,
      idUteSegn: freezed == idUteSegn
          ? _value.idUteSegn
          : idUteSegn // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageReportModelImplCopyWith<$Res>
    implements $MessageReportModelCopyWith<$Res> {
  factory _$$MessageReportModelImplCopyWith(_$MessageReportModelImpl value,
          $Res Function(_$MessageReportModelImpl) then) =
      __$$MessageReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id_msg_segn") int idMsgSegn,
      @JsonKey(name: "id_msg") String idMsg,
      @JsonKey(name: "des_mot") String desMot,
      @JsonKey(name: "dat_segn") DateTime? datSegn,
      @JsonKey(name: "dat_ult_mov") String? datUltMov,
      @JsonKey(name: "id_ute_segn") String? idUteSegn,
      bool isExpanded});
}

/// @nodoc
class __$$MessageReportModelImplCopyWithImpl<$Res>
    extends _$MessageReportModelCopyWithImpl<$Res, _$MessageReportModelImpl>
    implements _$$MessageReportModelImplCopyWith<$Res> {
  __$$MessageReportModelImplCopyWithImpl(_$MessageReportModelImpl _value,
      $Res Function(_$MessageReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMsgSegn = null,
    Object? idMsg = null,
    Object? desMot = null,
    Object? datSegn = freezed,
    Object? datUltMov = freezed,
    Object? idUteSegn = freezed,
    Object? isExpanded = null,
  }) {
    return _then(_$MessageReportModelImpl(
      idMsgSegn: null == idMsgSegn
          ? _value.idMsgSegn
          : idMsgSegn // ignore: cast_nullable_to_non_nullable
              as int,
      idMsg: null == idMsg
          ? _value.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as String,
      desMot: null == desMot
          ? _value.desMot
          : desMot // ignore: cast_nullable_to_non_nullable
              as String,
      datSegn: freezed == datSegn
          ? _value.datSegn
          : datSegn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datUltMov: freezed == datUltMov
          ? _value.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as String?,
      idUteSegn: freezed == idUteSegn
          ? _value.idUteSegn
          : idUteSegn // ignore: cast_nullable_to_non_nullable
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
class _$MessageReportModelImpl implements _MessageReportModel {
  const _$MessageReportModelImpl(
      {@JsonKey(name: "id_msg_segn") required this.idMsgSegn,
      @JsonKey(name: "id_msg") required this.idMsg,
      @JsonKey(name: "des_mot") required this.desMot,
      @JsonKey(name: "dat_segn") this.datSegn,
      @JsonKey(name: "dat_ult_mov") this.datUltMov,
      @JsonKey(name: "id_ute_segn") this.idUteSegn,
      this.isExpanded = false});

  factory _$MessageReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageReportModelImplFromJson(json);

  @override
  @JsonKey(name: "id_msg_segn")
  final int idMsgSegn;
  @override
  @JsonKey(name: "id_msg")
  final String idMsg;
  @override
  @JsonKey(name: "des_mot")
  final String desMot;
  @override
  @JsonKey(name: "dat_segn")
  final DateTime? datSegn;
  @override
  @JsonKey(name: "dat_ult_mov")
  final String? datUltMov;
  @override
  @JsonKey(name: "id_ute_segn")
  final String? idUteSegn;
  @override
  @JsonKey()
  final bool isExpanded;

  @override
  String toString() {
    return 'MessageReportModel(idMsgSegn: $idMsgSegn, idMsg: $idMsg, desMot: $desMot, datSegn: $datSegn, datUltMov: $datUltMov, idUteSegn: $idUteSegn, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageReportModelImpl &&
            (identical(other.idMsgSegn, idMsgSegn) ||
                other.idMsgSegn == idMsgSegn) &&
            (identical(other.idMsg, idMsg) || other.idMsg == idMsg) &&
            (identical(other.desMot, desMot) || other.desMot == desMot) &&
            (identical(other.datSegn, datSegn) || other.datSegn == datSegn) &&
            (identical(other.datUltMov, datUltMov) ||
                other.datUltMov == datUltMov) &&
            (identical(other.idUteSegn, idUteSegn) ||
                other.idUteSegn == idUteSegn) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idMsgSegn, idMsg, desMot,
      datSegn, datUltMov, idUteSegn, isExpanded);

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageReportModelImplCopyWith<_$MessageReportModelImpl> get copyWith =>
      __$$MessageReportModelImplCopyWithImpl<_$MessageReportModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageReportModelImplToJson(
      this,
    );
  }
}

abstract class _MessageReportModel implements MessageReportModel {
  const factory _MessageReportModel(
      {@JsonKey(name: "id_msg_segn") required final int idMsgSegn,
      @JsonKey(name: "id_msg") required final String idMsg,
      @JsonKey(name: "des_mot") required final String desMot,
      @JsonKey(name: "dat_segn") final DateTime? datSegn,
      @JsonKey(name: "dat_ult_mov") final String? datUltMov,
      @JsonKey(name: "id_ute_segn") final String? idUteSegn,
      final bool isExpanded}) = _$MessageReportModelImpl;

  factory _MessageReportModel.fromJson(Map<String, dynamic> json) =
      _$MessageReportModelImpl.fromJson;

  @override
  @JsonKey(name: "id_msg_segn")
  int get idMsgSegn;
  @override
  @JsonKey(name: "id_msg")
  String get idMsg;
  @override
  @JsonKey(name: "des_mot")
  String get desMot;
  @override
  @JsonKey(name: "dat_segn")
  DateTime? get datSegn;
  @override
  @JsonKey(name: "dat_ult_mov")
  String? get datUltMov;
  @override
  @JsonKey(name: "id_ute_segn")
  String? get idUteSegn;
  @override
  bool get isExpanded;

  /// Create a copy of MessageReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageReportModelImplCopyWith<_$MessageReportModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
