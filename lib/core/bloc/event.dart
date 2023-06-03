abstract class ProcessEvent {}

class InitEvent extends ProcessEvent {
  final dynamic data;
  final int processId;

  InitEvent({
    this.processId = 0,
    this.data,
  });
}

class ErrorEvent extends ProcessEvent {
  final int processId;

  ErrorEvent({this.processId = 0});
}

class SuccessEvent extends ProcessEvent {
  final dynamic data;
  final int processId;

  SuccessEvent({this.data, this.processId = 0});
}

class LoadingEvent extends ProcessEvent {
  final int processId;
  dynamic data;

  LoadingEvent({this.processId = 0, this.data});
}

class EmptyEvent extends ProcessEvent {
  final int processId;

  EmptyEvent({this.processId = 0});
}
