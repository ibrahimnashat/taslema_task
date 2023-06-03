// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:taslema_task/core/consts/exports.dart';

class MSvg extends StatelessWidget {
  final String? name;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  const MSvg({
    Key? key,
    this.name,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name!.contains('http')) {
      return SvgPicture.network(
        name!,
        width: width,
        height: height,
        fit: fit,
        color: color,
      );
    }
    return SvgPicture.asset(
      "assets/svgs/$name.svg",
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}

class MAssetImage extends StatelessWidget {
  final String? name;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  const MAssetImage({
    Key? key,
    this.borderRadius = 0,
    this.name,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        "assets/pngs/$name.png",
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class MLottieImage extends StatelessWidget {
  final String? name;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  const MLottieImage({
    Key? key,
    this.borderRadius = 0,
    this.name,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Lottie.asset(
        "assets/jsons/$name.json",
        width: width,
        height: height,
        fit: fit,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class MFileImage extends StatelessWidget {
  final String file;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  const MFileImage({
    Key? key,
    this.borderRadius = 0,
    required this.file,
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.file(
        File(file),
        width: width,
        height: height,
        fit: fit,
        color: color,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

class MNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final Color? color;
  final double borderRadius;
  const MNetworkImage({
    Key? key,
    this.borderRadius = 0,
    this.url = "",
    this.height = 25,
    this.width = 25,
    this.fit = BoxFit.contain,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.contains('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          color: color,
          alignment: Alignment.center,
          errorWidget: (errorWidget, error, child) {
            return MAssetImage(
              name: Pngs.empty,
              width: width,
              height: height,
              fit: fit,
              color: color,
              borderRadius: borderRadius,
            );
          },
          placeholder: (context, provider) => Loader.loaderWidget(),
        ),
      );
    } else {
      return MAssetImage(
        name: Pngs.empty,
        width: width,
        height: height,
        fit: fit,
        color: color,
        borderRadius: borderRadius,
      );
    }
  }
}
