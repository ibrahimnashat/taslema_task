import 'package:eitherx/eitherx.dart';
import 'package:taslema_task/features/task1/repository/models/user_model.dart';
import 'package:taslema_task/features/task1/repository/requests/get_user_request.dart';
import 'package:taslema_task/features/task1/repository/web_services/task1_client_service.dart';

import '../../../../core/consts/exports.dart';
import '../../../../core/framework/safe_request_handler.dart';

@injectable
class GetUser {
  final Task1ClientService clientService;
  final SafeApi api;
  const GetUser({
    required this.clientService,
    required this.api,
  });

  Future<Either<Failure, UserModel>> getUser({
    required GetUserRequest request,
  }) async {
    return await api<UserModel>(
      apiCall: clientService.getUser(id: request.id),
    );
  }
}
