import 'package:eitherx/eitherx.dart';
import 'package:taslema_task/core/consts/print.dart';

import 'exports.dart';

extension OnEither<T> on Either<Failure, T> {
  dynamic right(Function(T data) callBack) {
    return fold(
      (failure) {
        kPrint('Error! $failure');
      },
      (data) {
        callBack(data);
        return data;
      },
    );
  }

  void left(Function(Failure failure) callBack) {
    fold(
      (failure) {
        callBack(failure);
      },
      (data) {},
    );
  }
}
