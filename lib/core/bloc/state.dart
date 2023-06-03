abstract class ProcessState {}

class InitState extends ProcessState {
  final int processId;

  InitState({this.processId = 0});
}

class ErrorState extends ProcessState {
  final int processId;

  ErrorState({this.processId = 0});
}

class SuccessState extends ProcessState {
  final dynamic data;
  final int processId;

  SuccessState({this.data, this.processId = 0});
}

class LoadingState extends ProcessState {
  final int processId;

  LoadingState({this.processId = 0});
}

class EmptyState extends ProcessState {
  final int processId;

  EmptyState({this.processId = 0});
}
