import 'package:bible_quest/app/modules/errors/models/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoConnectionView extends StatefulWidget {
  /// The function executed when the refresh button is clicked
  final Function toPageReturn;

  /// The error type to be displayed in the page
  final InternetErrorType errorType;

  NoConnectionView({
    Key? key,
    required this.toPageReturn,
    this.errorType = InternetErrorType.client,
  }) : super(key: key);

  @override
  State<NoConnectionView> createState() => _NoConnectionViewState();
}

class _NoConnectionViewState extends State<NoConnectionView> {
  late IconData icon;

  late String titleText;

  late String bodyText;

  @override
  void initState() {
    super.initState();
    switch (widget.errorType) {
      case InternetErrorType.client:
        icon = Icons.signal_wifi_connected_no_internet_4_rounded;
        titleText = "Error de conexión";
        bodyText =
            "Por favor revise la conexion de su celular para poder proceder";
        break;
      case InternetErrorType.server:
        icon = Icons.sentiment_very_dissatisfied_rounded;
        titleText = "Error del servidor";
        bodyText =
            "Actualmente estamos teniendo problemas para conextarnos al servidor, estamos trabajando en ello";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 25),
          child: Icon(
            icon,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 25, left: 25, right: 25),
          child: Text(
            titleText,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Text(
            bodyText,
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 5.0, onPrimary: Colors.white),
            child: Text('reload'.tr.capitalizeFirst!),
            onPressed: () {
              widget.toPageReturn();
            })
      ],
    ));
  }
}
