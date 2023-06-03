import '../../../core/consts/exports.dart';
import 'group_item_widget.dart';

class EventItemWidget extends StatelessWidget {
  final Function onTap;
  const EventItemWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w * 0.6,
      margin: const EdgeInsetsDirectional.only(end: 12.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Coolors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Coolors.highLightAccent,
            blurRadius: 1.0,
          )
        ],
      ),
      child: Column(
        children: [
          Stack(
            fit: StackFit.expand,
            children: [
              const MNetworkImage(
                url:
                    'https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg',
                fit: BoxFit.cover,
                borderRadius: 16.0,
              ),
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                        vertical: 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Coolors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MText(
                            text: '10',
                            textColor: Coolors.brown,
                            textSize: FoontSize.font18,
                            textWeight: FontWeight.w500,
                          ),
                          MText(
                            text: 'JUNE',
                            textColor: Coolors.brown,
                            textSize: FoontSize.font12,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Coolors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const MSvg(
                        name: Svgs.archive,
                        color: Coolors.brown,
                      ),
                    )
                  ],
                ).addPadding(all: 8.0),
              )
            ],
          ).setSize(width: context.w * 0.6, height: 180.0),
          MText(
            text: 'Free Download Food Restaurant',
            textSize: FoontSize.font19,
            textWeight: FontWeight.w500,
          ).addPadding(vertical: 8.0),
          const GroupItemWidget(
            title: '+20 Going',
          ),
          Row(
            children: [
              const MSvg(
                name: Svgs.location,
                color: Coolors.grey,
                height: 18.0,
              ).addPadding(end: 6.0),
              Expanded(
                child: MText(
                  text: 'Home Assistant Outlined Icons',
                  textColor: Coolors.grey,
                  textSize: FoontSize.font17,
                ),
              )
            ],
          ).addPadding(vertical: 6.0)
        ],
      ),
    ).addAction(onGesture: onTap);
  }
}
