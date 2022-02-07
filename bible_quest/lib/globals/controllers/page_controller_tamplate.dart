import 'package:bible_quest/app/modules/errors/models/enums.dart';
import 'package:bible_quest/app/modules/errors/views/no_connection_view.dart';
import 'package:bible_quest/globals/controllers/api_controller_template.dart';
import 'package:bible_quest/services/connectivity/enums/http_exception_types.dart';
import 'package:bible_quest/services/connectivity/exceptions/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageControllerTemplate extends GetxController {
  /// True if an error occurs on an http call
  var errorOcurred = false.obs;

  /// The http error type if exists
  InternetErrorType? callErrorException;

  /// The api controllers necesary for the page
  List<ApiControllerTemplate> apiControllers = [];

  /// Refreshes the content inside the controller
  void refreshContent() {}

  /// Returns the page where says the error in which why the screen couldn't load
  Widget internetPage(InternetErrorType errorType) {
    switch (errorType) {
      case InternetErrorType.client:
        return NoConnectionView(
          toPageReturn: refreshContent,
          errorType: InternetErrorType.client,
        );
      case InternetErrorType.server:
        return NoConnectionView(
          toPageReturn: refreshContent,
          errorType: InternetErrorType.server,
        );
      default:
        return Center(
          child: Column(
            children: [
              Text("Ha ocurrido un error inesperado"),
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

  /// Returns the [RxStatus] of the [exception] called
  InternetErrorType _getStatusError(HttpExceptions exception) {
    switch (exception) {
      case HttpExceptions.ClientError:
      case HttpExceptions.ConnectionError:
      case HttpExceptions.ClientOffline:
        return InternetErrorType.client;
      case HttpExceptions.ServerDown:
      case HttpExceptions.ServerError:
        return InternetErrorType.server;
      case HttpExceptions.ExpiredToken:
      case HttpExceptions.Unauthorized:
      case HttpExceptions.Other:
        return InternetErrorType.other;
    }
  }

  void loadPage() async {
    apiControllers.forEach((controller) async {
      try {
        await controller.loadData();
      } on HttpCallException catch (e) {
        errorOcurred(true);
        callErrorException = _getStatusError(e.type);
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
