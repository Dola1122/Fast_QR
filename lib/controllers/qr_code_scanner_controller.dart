import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../views/scanned_qr_code_view.dart';

class QRCodeScannerController extends GetxController {
  Rx<QRViewController?> controller = Rx<QRViewController?>(null);
  Rx<Barcode?> result = Rx<Barcode?>(null);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  RxBool isFlashOn = false.obs;
  RxBool isBackCamera = true.obs;

  void onQRViewCreated(QRViewController controller) {
    this.controller.value = controller;
    controller.scannedDataStream.listen((scanData) {
      result.value = scanData;
      log(scanData.code.toString());

      // Navigate to the ScannedQRView after scanning the QR code.
      Get.off(() => ScannedQRView(data: scanData));
      Get.delete<QRCodeScannerController>();
    });
  }


  void toggleFlash() {
    controller.value?.toggleFlash();
    isFlashOn.value = !isFlashOn.value;
  }

  void flipCamera() {
    controller.value?.flipCamera();
    isBackCamera.value = !isBackCamera.value;
  }

  @override
  void onClose() {
    controller.value?.dispose();
    super.onClose();
  }
}
