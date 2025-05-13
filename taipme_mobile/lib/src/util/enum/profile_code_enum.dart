import 'package:freezed_annotation/freezed_annotation.dart';

enum ProfileCodeEnum {
  @JsonValue("ADM") 
  adm,
  @JsonValue("ANY") 
  any,
  @JsonValue("BAN") 
  ban,
  @JsonValue("REG")
  reg,
}