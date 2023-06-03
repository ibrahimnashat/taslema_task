import 'package:taslema_task/core/consts/date_time.dart';

extension OnDoubleNull on double? {
  double get value => this ?? 0.0;
}

extension OnNull on Null {
  num get numValue => this ?? 0.0;
}

extension OnInt on int? {
  int get value => this ?? 0;
  String get dateOnly =>
      DateTime.fromMillisecondsSinceEpoch(this ?? 0).dateOnly;
  String get timeAndDate =>
      DateTime.fromMillisecondsSinceEpoch(this ?? 0).timeAndDate;
  String get timeOnly =>
      DateTime.fromMillisecondsSinceEpoch(this ?? 0).time12Only;
}
