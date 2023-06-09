import 'package:json_annotation/json_annotation.dart';

import 'geo_model.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  @JsonKey(defaultValue: '')
  String street;
  @JsonKey(defaultValue: '')
  String suite;
  @JsonKey(defaultValue: '')
  String city;
  @JsonKey(defaultValue: '')
  String zipcode;
  GeoModel? geo;

  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
