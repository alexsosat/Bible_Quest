import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerTemplate extends GetxController {
  var isLoading = true
      .obs; // Variable in charge of showing the loading screen while data is loading

  //abstract method which will act based on the button of the NoInternetPage
  void refreshContent() {}

  // Returns the page where says the error in which why the creen couldn't load
  Widget internetPage() {
    return Center(
      child: Column(
        children: [
          Text("Sin conexión a internet"),
          ElevatedButton(
            onPressed: refreshContent,
            child: Text("Refrescar pagina"),
          ),
        ],
      ),
    ); //ContentNoInternet(toPageReturn: refreshContent);
  }
}
