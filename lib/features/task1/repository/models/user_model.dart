import 'package:json_annotation/json_annotation.dart';
import 'package:taslema_task/features/task1/repository/models/company_model.dart';

import 'address_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String username;
  @JsonKey(defaultValue: '')
  String email;
  AddressModel? address;
  @JsonKey(defaultValue: '')
  String phone;
  @JsonKey(defaultValue: '')
  String website;
  CompanyModel? company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    this.company,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
