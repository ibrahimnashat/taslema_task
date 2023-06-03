import 'package:eitherx/eitherx.dart';
import 'package:taslema_task/features/task1/repository/models/post_model.dart';
import 'package:taslema_task/features/task1/repository/web_services/task1_client_service.dart';

import '../../../../core/consts/exports.dart';
import '../../../../core/framework/safe_request_handler.dart';

@injectable
class GetPosts {
  final Task1ClientService clientService;
  final SafeApi api;
  const GetPosts({
    required this.clientService,
    required this.api,
  });

  Future<Either<Failure, List<PostModel>?>> getPosts() async {
    return await api<List<PostModel>?>(
      apiCall: clientService.getPosts(),
    );
  }
}
