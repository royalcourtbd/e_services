import 'package:e_services/presentation/services/seller_service.dart';
import 'package:get/get.dart';

import '../../presentation/services/auth_services.dart';

class Base {
  static final authC = Get.find<AuthController>();
  static final sellerC = Get.find<SellerService>();
}
