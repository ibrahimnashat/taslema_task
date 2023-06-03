// ignore_for_file: invalid_use_of_visible_for_testing_member

import '../../../core/bloc/event.dart';
import '../../../core/bloc/state.dart';
import '../../../core/consts/exports.dart';

@injectable
class MainBloc extends Bloc<ProcessEvent, ProcessState> {
  int indx = 0;
  late final TabController tabController;

  MainBloc() : super(InitState()) {
    on<ProcessEvent>(_init);
  }

  void _init(ProcessEvent event, Emitter<ProcessState> emit) async {
    if (event is LoadingEvent) {
      animateTo(event.data);
    }
  }

  void init(vsync) {
    tabController = TabController(
      length: 5,
      vsync: vsync,
    );
    tabController.addListener(() {
      animateTo(tabController.index);
    });
  }

  void animateTo(value) {
    emit(LoadingState());
    indx = value;
    tabController.animateTo(value);
    emit(SuccessState());
  }
}
