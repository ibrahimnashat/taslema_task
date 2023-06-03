import 'package:taslema_task/core/widgets/dropdown/drop_down.dart';

import '../../../core/consts/exports.dart';

class TopBarWidget extends StatelessWidget {
  final Function onTapMenu;
  final Widget footer;

  const TopBarWidget({
    Key? key,
    required this.onTapMenu,
    required this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedDirectional(
          top: 0.0,
          start: 0.0,
          end: 0.0,
          bottom: 25.0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            decoration: const BoxDecoration(
              color: Coolors.primaryColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50.0),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MSvg(
                      name: Svgs.menu,
                      color: Coolors.white,
                      height: 28.0,
                    ).addAction(onGesture: onTapMenu),
                    Expanded(
                      child: Center(
                        child: MDropDown<String>(
                          height: 30.0,
                          titleAlign: AlignmentDirectional.center,
                          isExpanded: false,
                          iconSize: 28.0,
                          textColor: Coolors.white,
                          paddingVertical: 0.0,
                          titleColor: Coolors.white,
                          footerTitle: 'New Yourk, USA',
                          hint: 'Current Location',
                          onChanged: (value) {},
                          itemTitle: (item) => item,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Coolors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const MSvg(
                        name: Svgs.notifications,
                        color: Coolors.white,
                        height: 28.0,
                      ),
                    ).addAction(onGesture: () {}),
                  ],
                ).addPadding(vertical: 18.0),
                MTextFiled(
                  border: InputBorder.none,
                  prefix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const MSvg(
                        name: Svgs.search,
                        color: Coolors.white,
                        height: 28.0,
                      ),
                      MText(
                        text: '|',
                        textSize: FoontSize.font22,
                        textColor: Coolors.highLight,
                      ).addPadding(horizontal: 8.0)
                    ],
                  ),
                  textSize: FoontSize.font22,
                  hintText: 'Search...',
                  textColor: Coolors.white,
                  suffix: Container(
                    width: 120.0,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Coolors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const MSvg(
                          name: Svgs.filter,
                          height: 28.0,
                        ),
                        MText(
                          text: 'Filter',
                          textSize: FoontSize.font20,
                          textColor: Coolors.highLight,
                        ).addPadding(horizontal: 12.0)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        PositionedDirectional(
          start: 0.0,
          end: 0.0,
          bottom: 0.0,
          child: footer,
        )
      ],
    );
  }
}
