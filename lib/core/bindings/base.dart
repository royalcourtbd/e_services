import 'package:e_services/presentation/services/seller_service.dart';
import 'package:get/get.dart';

import '../../presentation/services/auth_services.dart';
import '../../presentation/services/buyer_service.dart';

class Base {
  static final authC = Get.find<AuthController>();
  static final sellerC = Get.find<SellerService>();
  static final buyerC = Get.find<BuyerService>();
}
