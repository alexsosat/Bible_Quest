import 'package:bible_quest/services/connectivity/exceptions/http_exception.dart';
import 'package:get/get.dart';

class ApiControllerTemplate<T> extends GetxController with StateMixin<T> {
  /// The value of the controller data
  late T data;

  /// Loads the data from the api server
  Future loadData() async {}

  /// Executes a [httpCall] and the result is passed to [onSuccess] callback for his usage.
  ///
  /// If [httpCall] throws any exception that implements `HttpCallException`, a `RxStatus` is defined for the exception type and passed to [onCallError]. If any other exception occurs then the exception object itself is passed to [onError] callback.
  call<K>({
    required Future<K> Function() httpCall,
    required void Function(K) onSuccess,
    required void Function(HttpCallException) onCallError,
    required void Function(Object) onError,
    bool addToData = true,
  }) async {
    try {
      K res = await httpCall();
      if (addToData) {
        data = res as T;
      }
      onSuccess(res);
    } on HttpCallException catch (e) {
      onCallError(e);
    } catch (e) {
      onError(e);
    }
  }
}
