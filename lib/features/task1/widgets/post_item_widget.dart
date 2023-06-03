import 'package:taslema_task/features/task1/repository/models/post_model.dart';

import '../../../core/consts/exports.dart';
import '../views/user_info_screen.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 21.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: Coolors.highLightAccent,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText(
            text: '# ${post.id}',
            textSize: FoontSize.font20,
          ).addPadding(bottom: 8.0),
          MText(
            text: post.title,
            textSize: FoontSize.font18,
            maxLines: 2,
          ).addPadding(bottom: 8.0),
          MText(
            text: post.body,
            textSize: FoontSize.font16,
            textColor: Coolors.grey,
            maxLines: 8,
            maxWidth: context.w * 0.92,
          ).addPadding(bottom: 8.0),
        ],
      ),
    ).addAction(
      onGesture: () {
        context.push(
          UserInfoScreen(
            userId: post.userId,
          ),
        );
      },
    );
  }
}
