import '../../../core/consts/exports.dart';

class MoreItemWidget extends StatelessWidget {
  final Function onTap;
  final String title;
  const MoreItemWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MText(
          text: title,
          textSize: FoontSize.font20,
          textWeight: FontWeight.w500,
        ),
        Row(
          children: [
            MText(
              text: 'See All',
              textSize: FoontSize.font18,
              textColor: Coolors.grey,
            ).addPadding(end: 6.0),
            const MSvg(
              name: Svgs.next,
              color: Coolors.grey,
              height: 13.0,
            )
          ],
        ).addAction(onGesture: onTap)
      ],
    );
  }
}
