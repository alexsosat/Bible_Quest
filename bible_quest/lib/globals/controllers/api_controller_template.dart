import 'package:bible_quest/services/connectivity/exceptions/http_exception.dart';
import 'package:get/get.dart';

class ApiControllerTemplate<T> extends GetxController with StateMixin<T> {
  /// Executes a [httpCall] and the result is passed to [onSuccess] callback for his usage.
  ///
  /// If [httpCall] throws any exception that implements `HttpCallException`, a `RxStatus` is defined for the exception type and passed to [onCallError]. If any other exception occurs then the exception object itself is passed to [onError] callback.
  call<T>({
    required Future<T> Function() httpCall,
    required void Function(T) onSuccess,
    required void Function(HttpCallException) onCallError,
    required void Function(Object) onError,
  }) async {
    try {
      T res = await httpCall();
      onSuccess(res);
    } on HttpCallException catch (e) {
      onCallError(e);
    } catch (e) {
      onError(e);
    }
  }
}
