// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:taslema_task/core/bloc/event.dart';
import 'package:taslema_task/core/consts/exports.dart';
import 'package:taslema_task/features/task1/repository/usecases/get_user.dart';

import '../../../core/bloc/state.dart';
import '../repository/requests/get_user_request.dart';

@injectable
class UserInfoBloc extends Bloc<ProcessEvent, ProcessState> {
  final GetUser _getUser;

  UserInfoBloc(this._getUser) : super(InitState()) {
    on<ProcessEvent>(_init);
  }

  void _init(ProcessEvent event, Emitter<ProcessState> emit) async {
    if (event is LoadingEvent) {
      await getUser(event.data);
    }
  }

  Future<void> getUser(int id) async {
    emit(LoadingState());
    final res = await _getUser.getUser(request: GetUserRequest(id: id));
    res.left((failure) => emit(ErrorState()));
    res.right((data) {
      emit(SuccessState(data: data));
    });
  }
}
