import 'package:bible_quest/services/connectivity/exceptions/http_exception.dart';
import 'package:get/get_connect.dart';

import '../enums/http_exception_types.dart';

/// The Exception that is thrown if a client error ocurrs.
class ClientErrorException implements HttpCallException {
  /// The type of Exception.
  ///
  /// Can be as shown in the table below:
  ///
  /// |Type                      | Case                                                   |
  /// |--------------------------|--------------------------------------------------------|
  /// | `ExpiredToken`           | When access token is expired & need to be refresh      |
  /// | `Unauthorized`           | When an error occurred with the authorization          |
  @override
  HttpExceptions type;

  /// The information useful to manage exception.
  @override
  Map<String, dynamic> extras;

  /// The response from the call.
  @override
  String message;

  /// The response from the call.
  Response? response;

  /// The constructor for the client error general exception.
  ///
  /// Can receive the [response] of the HTTP call, a [message], and [extras] values that can be used to manage the exception.
  ClientErrorException(
    this.response, {
    this.message: '',
    this.extras: const {},
  }) : this.type = HttpExceptions.ClientError;

  /// The constructor for the unauthorized exception.
  ///
  /// Can receive the [response] of the HTTP call, a [message], and [extras] values that can be used to manage the exception.
  ClientErrorException.unauthorized(
    this.response, {
    this.message: '',
    this.extras: const {},
  }) : this.type = HttpExceptions.Unauthorized;

  /// The constructor for the expired token exception.
  ///
  /// Can receive the [response] of the HTTP call, a [message], and [extras] values that can be used to manage the exception.
  ClientErrorException.expiredToken(
    this.response, {
    this.message: '',
    this.extras: const {},
  }) : this.type = HttpExceptions.ExpiredToken;
}
