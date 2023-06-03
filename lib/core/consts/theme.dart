import 'package:taslema_task/core/consts/exports.dart';

class Themes {
  static ThemeData get light {
    return ThemeData.light().extendsOptions;
  }

  static ThemeData get dark {
    return ThemeData.dark().extendsOptions;
  }
}

extension OnTheme on ThemeData {
  ThemeData get extendsOptions {
    return copyWith(extensions: [], textTheme: TextTheme());
  }
}
