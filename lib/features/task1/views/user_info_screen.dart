import 'package:flutter/cupertino.dart';
import 'package:taslema_task/core/bloc/event.dart';
import 'package:taslema_task/core/injection/injectable.dart';
import 'package:taslema_task/features/task1/logic/user_Info_bloc.dart';
import 'package:taslema_task/features/task1/repository/models/user_model.dart';

import '../../../core/bloc/bloc_request.dart';
import '../../../core/consts/exports.dart';
import '../widgets/tile_item_widget.dart';

class UserInfoScreen extends StatelessWidget {
  final int userId;

  UserInfoScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final _bloc = getIt<UserInfoBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coolors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Coolors.white,
        leading: const Icon(
          CupertinoIcons.back,
          color: Coolors.primaryColor,
          size: 25.0,
        ).addAction(onTap: () {
          context.pop();
        }),
        title: MText(
          text: 'User Info',
          textSize: FoontSize.font22,
          textColor: Coolors.primaryColor,
        ),
      ),
      body: BlocRequest<UserInfoBloc>(
        bloc: _bloc..add(LoadingEvent(data: userId)),
        onSuccess: (bloc, state) {
          UserModel user = state.data;
          return MScroll(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MText(
                  text: 'Info',
                  textSize: FoontSize.font22,
                ).addPadding(bottom: 12.0, top: 21.0),
                TileItemWidget(
                  title: 'Name',
                  subtitle: user.name,
                ),
                TileItemWidget(
                  title: 'Email',
                  subtitle: user.email,
                ),
                TileItemWidget(
                  title: 'Phone',
                  subtitle: user.phone,
                ),
                TileItemWidget(
                  title: 'Website',
                  subtitle: user.website,
                ),
                MText(
                  text: 'Address',
                  textSize: FoontSize.font22,
                ).addPadding(bottom: 12.0, top: 21.0),
                MText(
                  text:
                      '${user.address?.city}, ${user.address?.street}, ${user.address?.suite}',
                  textSize: FoontSize.font16,
                  textColor: Coolors.grey,
                ).addPadding(bottom: 8.0),
                MText(
                  text: 'Company',
                  textSize: FoontSize.font22,
                ).addPadding(bottom: 12.0, top: 21.0),
                TileItemWidget(
                  title: 'Name',
                  subtitle: user.company?.name,
                ),
                TileItemWidget(
                  title: 'CatchPhrase',
                  subtitle: user.company?.catchPhrase,
                ),
                TileItemWidget(
                  title: 'BS',
                  subtitle: user.company?.bs,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
