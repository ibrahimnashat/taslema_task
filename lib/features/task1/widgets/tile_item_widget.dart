import '../../../core/consts/exports.dart';

class TileItemWidget extends StatelessWidget {
  final String? title, subtitle;
  const TileItemWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MText(
          text: '$title : ',
          textSize: FoontSize.font18,
        ),
        MText(
          text: subtitle,
          textSize: FoontSize.font16,
          textColor: Coolors.grey,
        ),
      ],
    ).addPadding(bottom: 8.0);
  }
}
