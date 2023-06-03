import 'package:taslema_task/core/bloc/bloc_request.dart';
import 'package:taslema_task/core/bloc/event.dart';
import 'package:taslema_task/core/injection/injectable.dart';
import 'package:taslema_task/features/task1/repository/models/post_model.dart';
import 'package:taslema_task/features/task1/widgets/post_item_widget.dart';

import '../../../core/consts/exports.dart';
import '../logic/posts_bloc.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({Key? key}) : super(key: key);
  final _bloc = getIt<PostsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coolors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Coolors.white,
        title: MText(
          text: 'Posts',
          textSize: FoontSize.font24,
          textColor: Coolors.primaryColor,
          textWeight: FontWeight.w500,
        ),
      ),
      body: BlocRequest<PostsBloc>(
        bloc: _bloc..add(InitEvent()),
        onSuccess: (bloc, state) {
          final List<PostModel> posts = state.data;
          return MScroll(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: Column(
              children: posts.map((post) {
                return PostItem(post: post);
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
