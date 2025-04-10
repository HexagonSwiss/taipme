// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FaqModelImpl _$$FaqModelImplFromJson(Map<String, dynamic> json) =>
    _$FaqModelImpl(
      idFaq: (json['id_faq'] as num).toInt(),
      domFaq: json['DOM_FAQ'] as String,
      risFaq: json['RIS_FAQ'] as String,
      datFaq: json['DAT_FAQ'] == null
          ? null
          : DateTime.parse(json['DAT_FAQ'] as String),
      codStaFaq: json['COD_STA_FAQ'] as String?,
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$$FaqModelImplToJson(_$FaqModelImpl instance) =>
    <String, dynamic>{
      'id_faq': instance.idFaq,
      'DOM_FAQ': instance.domFaq,
      'RIS_FAQ': instance.risFaq,
      'DAT_FAQ': instance.datFaq?.toIso8601String(),
      'COD_STA_FAQ': instance.codStaFaq,
      'isExpanded': instance.isExpanded,
    };
