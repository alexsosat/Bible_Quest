import 'package:bible_quest/app/modules/user/controllers/user_info_controller.dart';
import 'package:bible_quest/app/modules/user/models/start_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCharacter extends GetView<UserInfoController> {
  final double size;
  final BoxShape shape;
  final justUserFace;
  const UserCharacter({
    Key? key,
    required this.size,
    this.shape = BoxShape.rectangle,
    this.justUserFace = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Container(
        height: size,
        width: size,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.deepPurple[800],
          shape: shape,
        ),
        child: FittedBox(
          fit: (justUserFace) ? BoxFit.cover : BoxFit.contain,
          alignment: (justUserFace) ? Alignment.topCenter : Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                state!.currentItems.stringtoImagePath.base,
                fit: BoxFit.contain,
              ),
              Image.asset(
                state.currentItems.stringtoImagePath.body,
                fit: BoxFit.contain,
              ),
              Image.asset(StartItems.outline.imagePath),
              Image.asset(
                state.currentItems.stringtoImagePath.head,
                fit: BoxFit.contain,
              ),
              if (state.currentItems.arm != null &&
                  state.currentItems.arm!.isNotEmpty)
                Image.asset(
                  state.currentItems.stringtoImagePath.arm!,
                  fit: BoxFit.contain,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
