import 'dart:math';

import '../consts/exports.dart';

extension WidgetController on Widget {
  Widget get mCircular {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: this,
    );
  }

  Widget mRadius(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: this,
    );
  }

  Widget setSize({
    required double width,
    required double height,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: this,
    );
  }

  Widget setMaxWidth({required double width}) {
    return SizedBox(
      width: width,
      child: this,
    );
  }

  Widget addAction({
    Function? onTap,
    Function? onGesture,
    double allPadding = 0,
    double verticalPadding = 0,
    double horizontalPadding = 0,
    Alignment? alignment,
  }) {
    final child = Container(
      color: Colors.transparent,
      alignment: alignment,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Padding(
        padding: EdgeInsets.all(allPadding),
        child: this,
      ),
    );
    if (onTap != null) {
      return BouncingWidget(
        scaleFactor: 2,
        onPressed: () => onTap(),
        child: child,
      );
    } else if (onGesture != null) {
      return GestureDetector(
        onTap: () => onGesture(),
        child: child,
      );
    }
    return this;
  }

  Widget get mNotStratch => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [this],
      );

  Widget get mStretch {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: 0,
      child: this,
    );
  }

  Widget get mFlap {
    // if (SettingsCubit.locale.languageCode == "en") {
    //   return this;
    // }
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: this,
    );
  }
}
