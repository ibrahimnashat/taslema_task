import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:taslema_task/features/task1/repository/models/post_model.dart';

import '../../../../core/consts/constants.dart';
import '../models/user_model.dart';

part 'task1_client_service.g.dart';

@RestApi()
abstract class Task1ClientService {
  factory Task1ClientService(Dio dio, {String baseUrl}) = _Task1ClientService;

  @GET(Endpoints.getPosts)
  Future<List<PostModel>?> getPosts();

  @GET(Endpoints.getUser)
  Future<UserModel?> getUser({
    @Path('id') required int id,
  });
}
