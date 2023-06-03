import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  @JsonKey(defaultValue: 0)
  int userId;
  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: '')
  String title;
  @JsonKey(defaultValue: '')
  String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
