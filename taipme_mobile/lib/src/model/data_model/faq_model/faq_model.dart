import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_model.freezed.dart';
part 'faq_model.g.dart';

@freezed
class FaqModel with _$FaqModel {
  const factory FaqModel({
    @JsonKey(name: "id_faq") required int idFaq,
    @JsonKey(name: "DOM_FAQ") required String domFaq,
    @JsonKey(name: "RIS_FAQ") required String risFaq,
    @JsonKey(name: "DAT_FAQ") DateTime? datFaq,
    @JsonKey(name: "COD_STA_FAQ") String? codStaFaq,
    @Default(false) bool isExpanded,
  }) = _FaqModel;

  factory FaqModel.fromJson(Map<String, Object?> json) =>
      _$FaqModelFromJson(json);
}
