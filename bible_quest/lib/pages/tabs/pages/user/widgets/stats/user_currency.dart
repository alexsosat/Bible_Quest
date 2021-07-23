import 'package:bible_quest/bloc/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCurrencies extends StatelessWidget {
  const UserCurrencies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
        init: UserController(),
        builder: (controller) {
          return Row(
            children: <Widget>[
              Container(
                width: 20,
                height: 20,
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
              ),
              Text("Nivel ${controller.user.stats.level}"),
              Expanded(child: SizedBox()),
              Icon(Icons.monetization_on, color: Colors.yellow, size: 18),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(controller.user.stats.currency.toString()),
              ),
            ],
          );
        });
  }
}
