import 'package:taslema_task/core/injection/injectable.dart';
import 'package:taslema_task/features/task2/logic/home_bloc.dart';
import 'package:taslema_task/features/task2/widgets/top_bar_widget.dart';

import '../../../core/consts/exports.dart';
import '../widgets/event_item_widget.dart';
import '../widgets/invite_friends_item_widget.dart';
import '../widgets/more_item_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _bloc = getIt<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 240.0),
        child: TopBarWidget(
          onTapMenu: () {},
          footer: MScroll(
            axis: Axis.horizontal,
            padding: const EdgeInsetsDirectional.only(
              start: 18.0,
            ),
            child: Row(
              children: _bloc.items.map((item) {
                return Container(
                  margin: const EdgeInsetsDirectional.only(start: 12.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 21.0,
                    vertical: 12.0,
                  ),
                  decoration: BoxDecoration(
                    color: _bloc.color,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    children: [
                      MSvg(
                        name: item.icon,
                        height: 22.0,
                        width: 22.0,
                        fit: BoxFit.contain,
                        color: Coolors.white,
                      ).addPadding(end: 12.0),
                      MText(
                        text: item.name,
                        textSize: FoontSize.font20,
                        textColor: Coolors.white,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      body: MScroll(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            MoreItemWidget(
              title: 'Upcoming Events',
              onTap: () {},
            ),
            MScroll(
              padding: const EdgeInsets.only(top: 21.0),
              axis: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) {
                  return EventItemWidget(
                    onTap: () {},
                  );
                }),
              ),
            ),
            InviteFriendsItemWidget(onTap: () {}),
            MoreItemWidget(
              title: 'Nearby You',
              onTap: () {},
            ).addPadding(top: 21.0),
          ],
        ),
      ),
    );
  }
}
