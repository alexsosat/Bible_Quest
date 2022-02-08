import 'package:bible_quest/globals/controllers/page_controller_tamplate.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GetPageBuilder<T extends PageControllerTemplate> extends StatelessWidget {
  final Widget child;

  const GetPageBuilder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<T>(
      builder: (controller) {
        if (controller.errorOcurred.value &&
            controller.callErrorException != null) {
          return controller.internetPage(controller.callErrorException!);
        }
        return child;
      },
    );
  }
}
