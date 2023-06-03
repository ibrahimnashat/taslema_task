import 'package:taslema_task/core/bloc/state.dart';

import '../consts/exports.dart';
import 'event.dart';

class BlocRequest<T extends Bloc<ProcessEvent, ProcessState>>
    extends StatelessWidget {
  final T bloc;
  final int mainProcessId;
  final Widget Function(T cubit, SuccessState state) onSuccess;
  final Widget Function(T cubit)? onError;
  final Widget Function(T cubit)? onLoading;
  final Widget Function(T cubit)? onEmpty;
  const BlocRequest({
    super.key,
    required this.onSuccess,
    required this.bloc,
    this.mainProcessId = 0,
    this.onError,
    this.onLoading,
    this.onEmpty,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, ProcessState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is LoadingState && state.processId == mainProcessId) {
          if (onLoading == null) return Loader.loader();
          return onLoading!(bloc);
        } else if (state is SuccessState) {
          return onSuccess(bloc, state);
        } else if (state is ErrorState) {
          if (onError == null) return Loader.errorWidget(size: 400.0);
          return onError!(bloc);
        } else if (state is EmptyState) {
          if (onEmpty == null) return Loader.emptyWidget(size: 400.0);
          return onEmpty!(bloc);
        }
        return const SizedBox();
      },
    );
  }
}
