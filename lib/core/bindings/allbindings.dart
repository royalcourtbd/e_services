import 'package:e_services/presentation/services/auth_services.dart';
import 'package:e_services/presentation/services/seller_service.dart';
import 'package:get/get.dart';

import '../../presentation/services/buyer_service.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => SellerService());
    Get.lazyPut(() => BuyerService());
  }
}
