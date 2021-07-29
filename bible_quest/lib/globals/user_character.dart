import 'package:bible_quest/bloc/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCharacter extends StatelessWidget {
  final double size;
  final BoxShape shape;
  const UserCharacter({
    Key? key,
    required this.size,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: GetBuilder<UserController>(
          init: UserController(),
          builder: (controller) {
            if (controller.isLoading.value)
              return Center(child: CircularProgressIndicator());
            return Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: Colors.deepPurple[800],
                shape: shape,
              ),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    controller.user.currentItems.base,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    controller.user.currentItems.body,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    controller.user.currentItems.head,
                    fit: BoxFit.contain,
                  ),
                  if (controller.user.currentItems.arm != null &&
                      controller.user.currentItems.arm!.isNotEmpty)
                    Image.asset(
                      controller.user.currentItems.arm!,
                      fit: BoxFit.contain,
                    ),
                ],
              ),
            );
          }),
    );
  }
}
