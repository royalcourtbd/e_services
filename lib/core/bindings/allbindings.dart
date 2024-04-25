import 'package:e_services/presentation/services/auth_services.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
 Get.lazyPut(() => AuthController());
  }
}
