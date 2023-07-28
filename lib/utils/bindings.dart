import 'package:fast_qr/controllers/qr_code_scanner_controller.dart';
import 'package:fast_qr/controllers/qr_generator_controller.dart';
import 'package:get/get.dart';

import '../controllers/control_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QRCodeScannerController());
    Get.lazyPut(() => ControlController());
  }
}
