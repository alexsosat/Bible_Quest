import 'package:bible_quest/app/modules/user/modules/create/bindings/create_user_bindings.dart';
import 'package:bible_quest/app/modules/user/modules/create/views/create_user_view.dart';
import 'package:bible_quest/app/modules/user/providers/user_provider.dart';
import 'package:get/get.dart';

class CreateUserController extends GetxController {
  final provider = UserProvider();

  var headSprite = "tile026".obs;
  var bodySprite = "tile064".obs;
  var baseSprite = "tile007".obs;

  @override
  void onInit() {
    super.onInit();
  }


}
