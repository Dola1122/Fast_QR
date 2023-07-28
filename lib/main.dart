import 'package:fast_qr/utils/bindings.dart';
import 'package:fast_qr/views/control_view.dart';
import 'package:fast_qr/views/history_view.dart';
import 'package:fast_qr/views/qr_code_generator_view.dart';
import 'package:fast_qr/views/qr_code_scanner_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/qr_code_scanner_controller.dart';
import 'controllers/qr_generator_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: 'QR Code Scanner App',
      home:
          // QRCodeGeneratorView(),
          // QRCodeScannerView(),
          // HistoryView(),
          ControlView(),
    );
  }
}
