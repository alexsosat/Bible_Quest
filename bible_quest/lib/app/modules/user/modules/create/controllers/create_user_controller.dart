import 'package:bible_quest/app/modules/login/controllers/authentication_controller.dart';
import 'package:bible_quest/app/modules/user/models/current_items.dart';
import 'package:bible_quest/app/modules/user/models/start_items.dart';
import 'package:bible_quest/app/modules/user/models/stats/stats.dart';
import 'package:bible_quest/app/modules/user/models/user.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:bible_quest/app/routes/app_pages.dart';
import 'package:get/get.dart';

class CreateUserController extends GetxController {
  final provider = UserProvider();

  var headSprite = 0.obs;
  var bodySprite = 0.obs;
  var baseSprite = 0.obs;

  createUser() async {
    final _authController = Get.find<AuthenticationController>();

    User user = User(
      key: _authController.userUID!,
      username: _authController.username!,
      currentReadings: [
        CurrentReading(
          planName: "Bible",
          readed: {},
        )
      ],
      items: [],
      currentItems: CurrentItems(
        base: StartItems.base[baseSprite.value].assetName,
        head: StartItems.heads[headSprite.value].assetName,
        body: StartItems.bodies[bodySprite.value].assetName,
      ),
      stats: Stats.initialStats(),
    );

    print("creating user");
    final bool wasCreated = await provider.createUser(user);

    if (wasCreated) {
      print("user Created");
      Get.toNamed(Routes.NAVIGATION);
    } else {
      print("couldn't create user");
    }
  }
}
