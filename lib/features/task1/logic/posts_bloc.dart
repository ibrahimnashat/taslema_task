// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:taslema_task/core/bloc/event.dart';
import 'package:taslema_task/core/consts/exports.dart';

import '../../../core/bloc/state.dart';
import '../repository/usecases/get_posts.dart';

@injectable
class PostsBloc extends Bloc<ProcessEvent, ProcessState> {
  final GetPosts _getPosts;

  PostsBloc(this._getPosts) : super(InitState()) {
    on<ProcessEvent>(_init);
  }

  void _init(ProcessEvent event, Emitter<ProcessState> emit) async {
    if (event is InitEvent) {
      await getPosts();
    }
  }

  Future<void> getPosts() async {
    emit(LoadingState());
    final res = await _getPosts.getPosts();
    res.left((failure) => emit(ErrorState()));
    res.right((data) {
      emit(SuccessState(data: data));
    });
  }
}
