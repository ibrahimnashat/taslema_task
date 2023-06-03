import '../../../core/consts/exports.dart';

class BottomBarWidget extends StatelessWidget {
  final int groupValue;
  final Function(int value) onChanged;

  const BottomBarWidget({
    super.key,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const _Item(icon: Svgs.explore, title: 'Explore'),
        const _Item(icon: Svgs.calendar, title: 'Events'),
        const _Item(icon: Svgs.add, title: 'Add'),
        const _Item(icon: Svgs.location, title: 'Map'),
        const _Item(icon: Svgs.profile, title: "Profile"),
      ].asMap().entries.map(
        (item) {
          final icon = Expanded(
            child: BottomBarItem(
              icon: item.value.icon,
              title: item.value.title,
              active: groupValue == item.key,
            ).addAction(
              onGesture: () {
                onChanged(item.key);
              },
            ),
          );
          if (item.key != 2) return icon;
          return const Expanded(
            child: SizedBox(
              width: 60.0,
              height: 60.0,
            ),
          );
        },
      ).toList(),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool active;
  final Color? color;

  const BottomBarItem({
    super.key,
    required this.active,
    required this.icon,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? (active ? Coolors.primaryColor : Coolors.grey);
    return Container(
      width: 50.0,
      height: 80.0,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MSvg(
            name: icon,
            height: 28.0,
            width: 28.0,
            color: color,
          ),
          if (title.isNotEmpty)
            MText(
              text: title,
              textSize: FoontSize.font12,
              textWeight: FontWeight.w400,
              textColor: color,
              maxLines: 2,
              textAlign: TextAlign.center,
            ).addPadding(top: 5.0)
        ],
      ),
    );
  }
}

class _Item {
  final String title;
  final String icon;

  const _Item({
    required this.icon,
    required this.title,
  });
}
