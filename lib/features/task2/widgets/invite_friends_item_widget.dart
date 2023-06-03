import '../../../core/consts/exports.dart';

class InviteFriendsItemWidget extends StatelessWidget {
  final Function onTap;

  const InviteFriendsItemWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      decoration: const BoxDecoration(
        color: Color(0xffDEBCB3),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          const MNetworkImage(
            url:
                'https://apis.xogrp.com/media-api/images/765c61e1-9030-47f4-a87c-d5abe56c2dd1',
            fit: BoxFit.cover,
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                MText(
                  text: 'Invite Your Friends',
                  textSize: FoontSize.font22,
                  textWeight: FontWeight.w500,
                  maxWidth: context.w * 0.5,
                ),
                MText(
                  text: "Get \$20 for ticket",
                  textSize: FoontSize.font18,
                ).addPadding(top: 6.0),
                Container(
                  margin: const EdgeInsets.only(top: 12.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: Coolors.brown,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: MText(
                    text: 'Invite',
                    textSize: FoontSize.font18,
                    textColor: Coolors.white,
                  ),
                )
              ],
            ).addPadding(all: 24.0),
          )
        ],
      ),
    ).mRadius(20.0).addPadding(top: 21.0).addAction(onGesture: onTap);
  }
}
