import '../../../core/consts/exports.dart';

class GroupItemWidget extends StatelessWidget {
  final String title;
  const GroupItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: Row(
        children: [
          SizedBox(
            width: 70.0,
            child: Stack(
              children: List.generate(3, (position) {
                return PositionedDirectional(
                  start: (30.0 * position) + (position * -12.0),
                  child: Container(
                    padding: const EdgeInsets.all(1.2),
                    decoration: const BoxDecoration(
                      color: Coolors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const MNetworkImage(
                      height: 30.0,
                      width: 30.0,
                      url:
                          'https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg',
                      fit: BoxFit.cover,
                      borderRadius: 100.0,
                    ),
                  ),
                );
              }),
            ).mFlap,
          ).addPadding(end: 8.0),
          MText(
            text: title,
            textColor: Coolors.primaryColor,
            textWeight: FontWeight.w500,
            textSize: FoontSize.font18,
          )
        ],
      ),
    );
  }
}
