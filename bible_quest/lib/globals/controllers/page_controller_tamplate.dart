import 'package:bible_quest/app/modules/errors/models/enums.dart';
import 'package:bible_quest/app/modules/errors/views/no_connection_view.dart';
import 'package:bible_quest/services/connectivity/enums/http_exception_types.dart';
import 'package:bible_quest/services/connectivity/exceptions/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageControllerTemplate extends GetxController {
  late Rx<HttpExceptions?> callErrorException;

  late Rx<Object?> errorException;

  /// Refreshes the content inside the controller
  void refreshContent() {}

  /// Returns the page where says the error in which why the screen couldn't load
  Widget internetPage(String? errorMessage) {
    switch (errorMessage) {
      case "clientError":
        return NoConnectionView(
          toPageReturn: refreshContent,
          errorType: InternetErrorType.client,
        );
      case "serverError":
        return NoConnectionView(
          toPageReturn: refreshContent,
          errorType: InternetErrorType.server,
        );
      default:
        return Center(
          child: Column(
            children: [
              Text(errorMessage ?? "null error"),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => refreshContent(),
                child: Text("Recargar modulo"),
              )
            ],
          ),
        );
    }
  }

  void loadPage({
    required void Function() builder,
    required void Function(HttpExceptions error) onCallError,
  }) {
    try {
      builder();
    } on HttpCallException catch (e) {
      callErrorException(e.type);
      onCallError(e.type);
    } catch (e) {
      errorException(e);
    }
  }
}
