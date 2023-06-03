import 'exports.dart';

extension OnString on String {
  String get dateOnly => DateTime.tryParse(this)?.dateOnly ?? '';
  String get timeOnly => DateTime.tryParse(this)?.time12Only ?? '';
  String get monthAndDay => DateTime.tryParse(this)?.monthAndDay ?? '';
  String get yearMonthDay => DateTime.tryParse(this)?.birthDateForm ?? '';
}

extension OnNullString on String? {
  String get value => this ?? '';
  String? get clear {
    if (this == '') return null;
    return this;
  }
}
