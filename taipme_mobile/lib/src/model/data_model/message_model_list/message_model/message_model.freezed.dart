// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageModel {
  int? get idMsg;
  int? get idUteAut;
  int? get idUteReply;
  int? get idMsgReply;
  int? get idFoglio;
  String? get desMsg;
  String? get titMsg; // Added from Java Messaggio
  String? get emailAut; // Added from Java Messaggio
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get dataPub;
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  DateTime? get datUltMov;
  MessageTypeEnum get codTipMsg;
  String? get desTipMsg; // Added from Java Messaggio
  bool? get tipMsgPub; // Added from Java Messaggio
  bool? get tipMsgPri; // Added from Java Messaggio
  String? get datUltMovView; // Added from Java Messaggio
  int? get idFoglioOrig; // Added from Java Messaggio
  bool? get segnala; // Added from Java Messaggio
  bool? get presenteRisposta; // Added from Java Messaggio
  String? get hashtag; // Added from Java Messaggio
  String? get desErrHashTag; // Added from Java Messaggio
  String? get desSuccessHashTag; // Added from Java Messaggio
  String? get desMot; // Added from Java Messaggio
  bool? get offensivo; // Added from Java Messaggio
  bool? get msgUteReg; // Added from Java Messaggio
  bool? get foundMsgPubRandom; // Added from Java Messaggio
  bool get isCurrent;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageModelCopyWith<MessageModel> get copyWith =>
      _$MessageModelCopyWithImpl<MessageModel>(
          this as MessageModel, _$identity);

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MessageModel &&
            (identical(other.idMsg, idMsg) || other.idMsg == idMsg) &&
            (identical(other.idUteAut, idUteAut) ||
                other.idUteAut == idUteAut) &&
            (identical(other.idUteReply, idUteReply) ||
                other.idUteReply == idUteReply) &&
            (identical(other.idMsgReply, idMsgReply) ||
                other.idMsgReply == idMsgReply) &&
            (identical(other.idFoglio, idFoglio) ||
                other.idFoglio == idFoglio) &&
            (identical(other.desMsg, desMsg) || other.desMsg == desMsg) &&
            (identical(other.titMsg, titMsg) || other.titMsg == titMsg) &&
            (identical(other.emailAut, emailAut) ||
                other.emailAut == emailAut) &&
            (identical(other.dataPub, dataPub) || other.dataPub == dataPub) &&
            (identical(other.datUltMov, datUltMov) ||
                other.datUltMov == datUltMov) &&
            (identical(other.codTipMsg, codTipMsg) ||
                other.codTipMsg == codTipMsg) &&
            (identical(other.desTipMsg, desTipMsg) ||
                other.desTipMsg == desTipMsg) &&
            (identical(other.tipMsgPub, tipMsgPub) ||
                other.tipMsgPub == tipMsgPub) &&
            (identical(other.tipMsgPri, tipMsgPri) ||
                other.tipMsgPri == tipMsgPri) &&
            (identical(other.datUltMovView, datUltMovView) ||
                other.datUltMovView == datUltMovView) &&
            (identical(other.idFoglioOrig, idFoglioOrig) ||
                other.idFoglioOrig == idFoglioOrig) &&
            (identical(other.segnala, segnala) || other.segnala == segnala) &&
            (identical(other.presenteRisposta, presenteRisposta) ||
                other.presenteRisposta == presenteRisposta) &&
            (identical(other.hashtag, hashtag) || other.hashtag == hashtag) &&
            (identical(other.desErrHashTag, desErrHashTag) ||
                other.desErrHashTag == desErrHashTag) &&
            (identical(other.desSuccessHashTag, desSuccessHashTag) ||
                other.desSuccessHashTag == desSuccessHashTag) &&
            (identical(other.desMot, desMot) || other.desMot == desMot) &&
            (identical(other.offensivo, offensivo) ||
                other.offensivo == offensivo) &&
            (identical(other.msgUteReg, msgUteReg) ||
                other.msgUteReg == msgUteReg) &&
            (identical(other.foundMsgPubRandom, foundMsgPubRandom) ||
                other.foundMsgPubRandom == foundMsgPubRandom) &&
            (identical(other.isCurrent, isCurrent) ||
                other.isCurrent == isCurrent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idMsg,
        idUteAut,
        idUteReply,
        idMsgReply,
        idFoglio,
        desMsg,
        titMsg,
        emailAut,
        dataPub,
        datUltMov,
        codTipMsg,
        desTipMsg,
        tipMsgPub,
        tipMsgPri,
        datUltMovView,
        idFoglioOrig,
        segnala,
        presenteRisposta,
        hashtag,
        desErrHashTag,
        desSuccessHashTag,
        desMot,
        offensivo,
        msgUteReg,
        foundMsgPubRandom,
        isCurrent
      ]);

  @override
  String toString() {
    return 'MessageModel(idMsg: $idMsg, idUteAut: $idUteAut, idUteReply: $idUteReply, idMsgReply: $idMsgReply, idFoglio: $idFoglio, desMsg: $desMsg, titMsg: $titMsg, emailAut: $emailAut, dataPub: $dataPub, datUltMov: $datUltMov, codTipMsg: $codTipMsg, desTipMsg: $desTipMsg, tipMsgPub: $tipMsgPub, tipMsgPri: $tipMsgPri, datUltMovView: $datUltMovView, idFoglioOrig: $idFoglioOrig, segnala: $segnala, presenteRisposta: $presenteRisposta, hashtag: $hashtag, desErrHashTag: $desErrHashTag, desSuccessHashTag: $desSuccessHashTag, desMot: $desMot, offensivo: $offensivo, msgUteReg: $msgUteReg, foundMsgPubRandom: $foundMsgPubRandom, isCurrent: $isCurrent)';
  }
}

/// @nodoc
abstract mixin class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) _then) =
      _$MessageModelCopyWithImpl;
  @useResult
  $Res call(
      {int? idMsg,
      int? idUteAut,
      int? idUteReply,
      int? idMsgReply,
      int? idFoglio,
      String? desMsg,
      String? titMsg,
      String? emailAut,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? dataPub,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? datUltMov,
      MessageTypeEnum codTipMsg,
      String? desTipMsg,
      bool? tipMsgPub,
      bool? tipMsgPri,
      String? datUltMovView,
      int? idFoglioOrig,
      bool? segnala,
      bool? presenteRisposta,
      String? hashtag,
      String? desErrHashTag,
      String? desSuccessHashTag,
      String? desMot,
      bool? offensivo,
      bool? msgUteReg,
      bool? foundMsgPubRandom,
      bool isCurrent});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res> implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._self, this._then);

  final MessageModel _self;
  final $Res Function(MessageModel) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMsg = freezed,
    Object? idUteAut = freezed,
    Object? idUteReply = freezed,
    Object? idMsgReply = freezed,
    Object? idFoglio = freezed,
    Object? desMsg = freezed,
    Object? titMsg = freezed,
    Object? emailAut = freezed,
    Object? dataPub = freezed,
    Object? datUltMov = freezed,
    Object? codTipMsg = null,
    Object? desTipMsg = freezed,
    Object? tipMsgPub = freezed,
    Object? tipMsgPri = freezed,
    Object? datUltMovView = freezed,
    Object? idFoglioOrig = freezed,
    Object? segnala = freezed,
    Object? presenteRisposta = freezed,
    Object? hashtag = freezed,
    Object? desErrHashTag = freezed,
    Object? desSuccessHashTag = freezed,
    Object? desMot = freezed,
    Object? offensivo = freezed,
    Object? msgUteReg = freezed,
    Object? foundMsgPubRandom = freezed,
    Object? isCurrent = null,
  }) {
    return _then(_self.copyWith(
      idMsg: freezed == idMsg
          ? _self.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as int?,
      idUteAut: freezed == idUteAut
          ? _self.idUteAut
          : idUteAut // ignore: cast_nullable_to_non_nullable
              as int?,
      idUteReply: freezed == idUteReply
          ? _self.idUteReply
          : idUteReply // ignore: cast_nullable_to_non_nullable
              as int?,
      idMsgReply: freezed == idMsgReply
          ? _self.idMsgReply
          : idMsgReply // ignore: cast_nullable_to_non_nullable
              as int?,
      idFoglio: freezed == idFoglio
          ? _self.idFoglio
          : idFoglio // ignore: cast_nullable_to_non_nullable
              as int?,
      desMsg: freezed == desMsg
          ? _self.desMsg
          : desMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      titMsg: freezed == titMsg
          ? _self.titMsg
          : titMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAut: freezed == emailAut
          ? _self.emailAut
          : emailAut // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPub: freezed == dataPub
          ? _self.dataPub
          : dataPub // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datUltMov: freezed == datUltMov
          ? _self.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codTipMsg: null == codTipMsg
          ? _self.codTipMsg
          : codTipMsg // ignore: cast_nullable_to_non_nullable
              as MessageTypeEnum,
      desTipMsg: freezed == desTipMsg
          ? _self.desTipMsg
          : desTipMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      tipMsgPub: freezed == tipMsgPub
          ? _self.tipMsgPub
          : tipMsgPub // ignore: cast_nullable_to_non_nullable
              as bool?,
      tipMsgPri: freezed == tipMsgPri
          ? _self.tipMsgPri
          : tipMsgPri // ignore: cast_nullable_to_non_nullable
              as bool?,
      datUltMovView: freezed == datUltMovView
          ? _self.datUltMovView
          : datUltMovView // ignore: cast_nullable_to_non_nullable
              as String?,
      idFoglioOrig: freezed == idFoglioOrig
          ? _self.idFoglioOrig
          : idFoglioOrig // ignore: cast_nullable_to_non_nullable
              as int?,
      segnala: freezed == segnala
          ? _self.segnala
          : segnala // ignore: cast_nullable_to_non_nullable
              as bool?,
      presenteRisposta: freezed == presenteRisposta
          ? _self.presenteRisposta
          : presenteRisposta // ignore: cast_nullable_to_non_nullable
              as bool?,
      hashtag: freezed == hashtag
          ? _self.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String?,
      desErrHashTag: freezed == desErrHashTag
          ? _self.desErrHashTag
          : desErrHashTag // ignore: cast_nullable_to_non_nullable
              as String?,
      desSuccessHashTag: freezed == desSuccessHashTag
          ? _self.desSuccessHashTag
          : desSuccessHashTag // ignore: cast_nullable_to_non_nullable
              as String?,
      desMot: freezed == desMot
          ? _self.desMot
          : desMot // ignore: cast_nullable_to_non_nullable
              as String?,
      offensivo: freezed == offensivo
          ? _self.offensivo
          : offensivo // ignore: cast_nullable_to_non_nullable
              as bool?,
      msgUteReg: freezed == msgUteReg
          ? _self.msgUteReg
          : msgUteReg // ignore: cast_nullable_to_non_nullable
              as bool?,
      foundMsgPubRandom: freezed == foundMsgPubRandom
          ? _self.foundMsgPubRandom
          : foundMsgPubRandom // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrent: null == isCurrent
          ? _self.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MessageModel implements MessageModel {
  const _MessageModel(
      {this.idMsg,
      this.idUteAut,
      this.idUteReply,
      this.idMsgReply,
      this.idFoglio,
      this.desMsg,
      this.titMsg,
      this.emailAut,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      this.dataPub,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      this.datUltMov,
      this.codTipMsg = MessageTypeEnum.public,
      this.desTipMsg,
      this.tipMsgPub,
      this.tipMsgPri,
      this.datUltMovView,
      this.idFoglioOrig,
      this.segnala,
      this.presenteRisposta,
      this.hashtag,
      this.desErrHashTag,
      this.desSuccessHashTag,
      this.desMot,
      this.offensivo,
      this.msgUteReg,
      this.foundMsgPubRandom,
      this.isCurrent = false});
  factory _MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  @override
  final int? idMsg;
  @override
  final int? idUteAut;
  @override
  final int? idUteReply;
  @override
  final int? idMsgReply;
  @override
  final int? idFoglio;
  @override
  final String? desMsg;
  @override
  final String? titMsg;
// Added from Java Messaggio
  @override
  final String? emailAut;
// Added from Java Messaggio
  @override
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  final DateTime? dataPub;
  @override
  @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
  final DateTime? datUltMov;
  @override
  @JsonKey()
  final MessageTypeEnum codTipMsg;
  @override
  final String? desTipMsg;
// Added from Java Messaggio
  @override
  final bool? tipMsgPub;
// Added from Java Messaggio
  @override
  final bool? tipMsgPri;
// Added from Java Messaggio
  @override
  final String? datUltMovView;
// Added from Java Messaggio
  @override
  final int? idFoglioOrig;
// Added from Java Messaggio
  @override
  final bool? segnala;
// Added from Java Messaggio
  @override
  final bool? presenteRisposta;
// Added from Java Messaggio
  @override
  final String? hashtag;
// Added from Java Messaggio
  @override
  final String? desErrHashTag;
// Added from Java Messaggio
  @override
  final String? desSuccessHashTag;
// Added from Java Messaggio
  @override
  final String? desMot;
// Added from Java Messaggio
  @override
  final bool? offensivo;
// Added from Java Messaggio
  @override
  final bool? msgUteReg;
// Added from Java Messaggio
  @override
  final bool? foundMsgPubRandom;
// Added from Java Messaggio
  @override
  @JsonKey()
  final bool isCurrent;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageModelCopyWith<_MessageModel> get copyWith =>
      __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageModel &&
            (identical(other.idMsg, idMsg) || other.idMsg == idMsg) &&
            (identical(other.idUteAut, idUteAut) ||
                other.idUteAut == idUteAut) &&
            (identical(other.idUteReply, idUteReply) ||
                other.idUteReply == idUteReply) &&
            (identical(other.idMsgReply, idMsgReply) ||
                other.idMsgReply == idMsgReply) &&
            (identical(other.idFoglio, idFoglio) ||
                other.idFoglio == idFoglio) &&
            (identical(other.desMsg, desMsg) || other.desMsg == desMsg) &&
            (identical(other.titMsg, titMsg) || other.titMsg == titMsg) &&
            (identical(other.emailAut, emailAut) ||
                other.emailAut == emailAut) &&
            (identical(other.dataPub, dataPub) || other.dataPub == dataPub) &&
            (identical(other.datUltMov, datUltMov) ||
                other.datUltMov == datUltMov) &&
            (identical(other.codTipMsg, codTipMsg) ||
                other.codTipMsg == codTipMsg) &&
            (identical(other.desTipMsg, desTipMsg) ||
                other.desTipMsg == desTipMsg) &&
            (identical(other.tipMsgPub, tipMsgPub) ||
                other.tipMsgPub == tipMsgPub) &&
            (identical(other.tipMsgPri, tipMsgPri) ||
                other.tipMsgPri == tipMsgPri) &&
            (identical(other.datUltMovView, datUltMovView) ||
                other.datUltMovView == datUltMovView) &&
            (identical(other.idFoglioOrig, idFoglioOrig) ||
                other.idFoglioOrig == idFoglioOrig) &&
            (identical(other.segnala, segnala) || other.segnala == segnala) &&
            (identical(other.presenteRisposta, presenteRisposta) ||
                other.presenteRisposta == presenteRisposta) &&
            (identical(other.hashtag, hashtag) || other.hashtag == hashtag) &&
            (identical(other.desErrHashTag, desErrHashTag) ||
                other.desErrHashTag == desErrHashTag) &&
            (identical(other.desSuccessHashTag, desSuccessHashTag) ||
                other.desSuccessHashTag == desSuccessHashTag) &&
            (identical(other.desMot, desMot) || other.desMot == desMot) &&
            (identical(other.offensivo, offensivo) ||
                other.offensivo == offensivo) &&
            (identical(other.msgUteReg, msgUteReg) ||
                other.msgUteReg == msgUteReg) &&
            (identical(other.foundMsgPubRandom, foundMsgPubRandom) ||
                other.foundMsgPubRandom == foundMsgPubRandom) &&
            (identical(other.isCurrent, isCurrent) ||
                other.isCurrent == isCurrent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idMsg,
        idUteAut,
        idUteReply,
        idMsgReply,
        idFoglio,
        desMsg,
        titMsg,
        emailAut,
        dataPub,
        datUltMov,
        codTipMsg,
        desTipMsg,
        tipMsgPub,
        tipMsgPri,
        datUltMovView,
        idFoglioOrig,
        segnala,
        presenteRisposta,
        hashtag,
        desErrHashTag,
        desSuccessHashTag,
        desMot,
        offensivo,
        msgUteReg,
        foundMsgPubRandom,
        isCurrent
      ]);

  @override
  String toString() {
    return 'MessageModel(idMsg: $idMsg, idUteAut: $idUteAut, idUteReply: $idUteReply, idMsgReply: $idMsgReply, idFoglio: $idFoglio, desMsg: $desMsg, titMsg: $titMsg, emailAut: $emailAut, dataPub: $dataPub, datUltMov: $datUltMov, codTipMsg: $codTipMsg, desTipMsg: $desTipMsg, tipMsgPub: $tipMsgPub, tipMsgPri: $tipMsgPri, datUltMovView: $datUltMovView, idFoglioOrig: $idFoglioOrig, segnala: $segnala, presenteRisposta: $presenteRisposta, hashtag: $hashtag, desErrHashTag: $desErrHashTag, desSuccessHashTag: $desSuccessHashTag, desMot: $desMot, offensivo: $offensivo, msgUteReg: $msgUteReg, foundMsgPubRandom: $foundMsgPubRandom, isCurrent: $isCurrent)';
  }
}

/// @nodoc
abstract mixin class _$MessageModelCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(
          _MessageModel value, $Res Function(_MessageModel) _then) =
      __$MessageModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? idMsg,
      int? idUteAut,
      int? idUteReply,
      int? idMsgReply,
      int? idFoglio,
      String? desMsg,
      String? titMsg,
      String? emailAut,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? dataPub,
      @JsonKey(fromJson: _fromJsonTimestamp, toJson: _toJsonTimestamp)
      DateTime? datUltMov,
      MessageTypeEnum codTipMsg,
      String? desTipMsg,
      bool? tipMsgPub,
      bool? tipMsgPri,
      String? datUltMovView,
      int? idFoglioOrig,
      bool? segnala,
      bool? presenteRisposta,
      String? hashtag,
      String? desErrHashTag,
      String? desSuccessHashTag,
      String? desMot,
      bool? offensivo,
      bool? msgUteReg,
      bool? foundMsgPubRandom,
      bool isCurrent});
}

/// @nodoc
class __$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(this._self, this._then);

  final _MessageModel _self;
  final $Res Function(_MessageModel) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idMsg = freezed,
    Object? idUteAut = freezed,
    Object? idUteReply = freezed,
    Object? idMsgReply = freezed,
    Object? idFoglio = freezed,
    Object? desMsg = freezed,
    Object? titMsg = freezed,
    Object? emailAut = freezed,
    Object? dataPub = freezed,
    Object? datUltMov = freezed,
    Object? codTipMsg = null,
    Object? desTipMsg = freezed,
    Object? tipMsgPub = freezed,
    Object? tipMsgPri = freezed,
    Object? datUltMovView = freezed,
    Object? idFoglioOrig = freezed,
    Object? segnala = freezed,
    Object? presenteRisposta = freezed,
    Object? hashtag = freezed,
    Object? desErrHashTag = freezed,
    Object? desSuccessHashTag = freezed,
    Object? desMot = freezed,
    Object? offensivo = freezed,
    Object? msgUteReg = freezed,
    Object? foundMsgPubRandom = freezed,
    Object? isCurrent = null,
  }) {
    return _then(_MessageModel(
      idMsg: freezed == idMsg
          ? _self.idMsg
          : idMsg // ignore: cast_nullable_to_non_nullable
              as int?,
      idUteAut: freezed == idUteAut
          ? _self.idUteAut
          : idUteAut // ignore: cast_nullable_to_non_nullable
              as int?,
      idUteReply: freezed == idUteReply
          ? _self.idUteReply
          : idUteReply // ignore: cast_nullable_to_non_nullable
              as int?,
      idMsgReply: freezed == idMsgReply
          ? _self.idMsgReply
          : idMsgReply // ignore: cast_nullable_to_non_nullable
              as int?,
      idFoglio: freezed == idFoglio
          ? _self.idFoglio
          : idFoglio // ignore: cast_nullable_to_non_nullable
              as int?,
      desMsg: freezed == desMsg
          ? _self.desMsg
          : desMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      titMsg: freezed == titMsg
          ? _self.titMsg
          : titMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAut: freezed == emailAut
          ? _self.emailAut
          : emailAut // ignore: cast_nullable_to_non_nullable
              as String?,
      dataPub: freezed == dataPub
          ? _self.dataPub
          : dataPub // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      datUltMov: freezed == datUltMov
          ? _self.datUltMov
          : datUltMov // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codTipMsg: null == codTipMsg
          ? _self.codTipMsg
          : codTipMsg // ignore: cast_nullable_to_non_nullable
              as MessageTypeEnum,
      desTipMsg: freezed == desTipMsg
          ? _self.desTipMsg
          : desTipMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      tipMsgPub: freezed == tipMsgPub
          ? _self.tipMsgPub
          : tipMsgPub // ignore: cast_nullable_to_non_nullable
              as bool?,
      tipMsgPri: freezed == tipMsgPri
          ? _self.tipMsgPri
          : tipMsgPri // ignore: cast_nullable_to_non_nullable
              as bool?,
      datUltMovView: freezed == datUltMovView
          ? _self.datUltMovView
          : datUltMovView // ignore: cast_nullable_to_non_nullable
              as String?,
      idFoglioOrig: freezed == idFoglioOrig
          ? _self.idFoglioOrig
          : idFoglioOrig // ignore: cast_nullable_to_non_nullable
              as int?,
      segnala: freezed == segnala
          ? _self.segnala
          : segnala // ignore: cast_nullable_to_non_nullable
              as bool?,
      presenteRisposta: freezed == presenteRisposta
          ? _self.presenteRisposta
          : presenteRisposta // ignore: cast_nullable_to_non_nullable
              as bool?,
      hashtag: freezed == hashtag
          ? _self.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String?,
      desErrHashTag: freezed == desErrHashTag
          ? _self.desErrHashTag
          : desErrHashTag // ignore: cast_nullable_to_non_nullable
              as String?,
      desSuccessHashTag: freezed == desSuccessHashTag
          ? _self.desSuccessHashTag
          : desSuccessHashTag // ignore: cast_nullable_to_non_nullable
              as String?,
      desMot: freezed == desMot
          ? _self.desMot
          : desMot // ignore: cast_nullable_to_non_nullable
              as String?,
      offensivo: freezed == offensivo
          ? _self.offensivo
          : offensivo // ignore: cast_nullable_to_non_nullable
              as bool?,
      msgUteReg: freezed == msgUteReg
          ? _self.msgUteReg
          : msgUteReg // ignore: cast_nullable_to_non_nullable
              as bool?,
      foundMsgPubRandom: freezed == foundMsgPubRandom
          ? _self.foundMsgPubRandom
          : foundMsgPubRandom // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCurrent: null == isCurrent
          ? _self.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
