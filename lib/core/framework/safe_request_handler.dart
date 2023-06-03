import 'package:eitherx/eitherx.dart';
import 'package:injectable/injectable.dart';

import '../consts/failures.dart';
import 'network.dart';

@injectable
class SafeApi {
  final Network _networkInfo;

  SafeApi(this._networkInfo);

  Future<Either<Failure, T>> call<T>({
    required Future<dynamic> apiCall,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call API
        final res = await apiCall;
        return Right(res);
      } catch (error, stacktrace) {
        return Left(RequestFailure());
      }
    } else {
      return Left(NoInternetConnection());
    }
  }
}
