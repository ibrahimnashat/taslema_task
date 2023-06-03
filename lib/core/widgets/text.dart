// ignore_for_file: must_be_immutable

import 'package:taslema_task/core/consts/exports.dart';

class MText extends StatelessWidget {
  final dynamic text;
  final Color textColor;
  final double textSize;
  String? fontFamily;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? maxWidth;
  final TextDecoration textDecoration;
  final FontWeight? textWeight;
  MText({
    Key? key,
    this.text = "",
    this.fontFamily,
    this.textWeight,
    this.textColor = Colors.black,
    this.textSize = FoontSize.font20,
    this.maxLines,
    this.textAlign,
    this.maxWidth,
    this.textDecoration = TextDecoration.none,
  }) : super(key: key) {
    ttext = (text.toString() ?? "").replaceAll('null', '');
  }
  late String ttext;

  @override
  Widget build(BuildContext context) {
    fontFamily ??= FoontFamily.rubik;
    return SizedBox(
      width: maxWidth,
      child: Text(
        ttext,
        style: TextStyle(
          color: textColor,
          fontFamily: fontFamily,
          fontSize: textSize,
          decoration: textDecoration,
          decorationStyle: TextDecorationStyle.solid,
          decorationThickness: 1.4,
          height: 1.3,
          fontWeight: textWeight ?? FontWeight.w400,
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
      ),
    );
  }
}

// typedef TextBuilder = String Function(
//   bool opertion,
//   String result1,
//   String result2,
// );
