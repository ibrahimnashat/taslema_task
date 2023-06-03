import '../../main.dart';
import '../consts/exports.dart';

class Loader {
  static void show() {
    showDialog(
      context: rootContext.context,
      builder: (context) {
        return AlertDialog(
          elevation: 0.0,
          contentPadding: const EdgeInsets.all(35.0),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingAnimationWidget.halfTriangleDot(
                color: Coolors.primaryColor,
                size: 50.0,
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget empty() {
    return const SizedBox(
      height: 700,
      child: Center(
        child: MSvg(
          name: Svgs.empty,
          width: 300,
          height: 300,
        ),
      ),
    );
  }

  static Widget buttonLoading({
    Color color = Coolors.primaryColor,
    double width = 150.0,
    double size = 35.0,
    double padding = 0.0,
  }) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: LoadingAnimationWidget.discreteCircle(
          color: Coolors.white,
          size: size,
        ),
      ),
    ).addPadding(all: padding);
  }

  static Widget loaderWidget({Color color = Coolors.primaryColor}) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: color,
        size: 35.0,
      ),
    ).addPadding(all: 32.0);
  }

  static Widget loader(
      {Color color = Coolors.primaryColor, double padding = 0.0}) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: color,
        size: 35.0,
      ),
    ).addPadding(all: padding);
  }

  static Widget emptyWidget({double size = 100.0}) {
    return Center(
      child: MSvg(
        name: Svgs.empty,
        width: size,
        height: size,
      ),
    ).addPadding(all: 32.0);
  }

  static Widget errorWidget({double size = 100.0}) {
    return Center(
      child: MLottieImage(
        name: Jsons.error,
        width: size,
        height: size,
      ),
    ).addPadding(all: 32.0);
  }

  static void dismiss() => rootContext.context.pop();
}
