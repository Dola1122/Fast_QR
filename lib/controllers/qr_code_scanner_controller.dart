import 'dart:developer';
import 'package:fast_qr/views/scanned_qr_code_views/scanned_text_qr_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../utils/helpers/qr_data_helper.dart';
import '../utils/helpers/qr_type_helper.dart';
import '../utils/qr_type_enum.dart';
import '../utils/qr_type_enum.dart';
import '../views/scanned_qr_code_view.dart';
import '../views/scanned_qr_code_views/scanned_url_qr_view.dart';
import '../views/scanned_qr_code_views/scanned_wifi_qr_view.dart';

class QRCodeScannerController extends GetxController {
  Rx<QRViewController?> controller = Rx<QRViewController?>(null);
  Rx<Barcode?> result = Rx<Barcode?>(null);
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  RxBool isFlashOn = false.obs;
  RxBool isBackCamera = true.obs;

  void onQRViewCreated(QRViewController controller) {
    this.controller.value = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        // to make it scan qr codes only
        if (scanData.format == BarcodeFormat.qrcode) {
          result.value = scanData;
          log(scanData.code.toString());
          QRData data = QRData.fromDataString(scanData.code!);
          QRType type = data.type;

          switch (type) {
            case QRType.text:
              Get.off(() => ScannedTextQRView(data: data as TextQRData));
              break;
            case QRType.url:
              Get.to(() => ScannedUrlQRView(data: data as UrlQRData));
              break;
            case QRType.wifi:
              Get.to(() => ScannedWifiQRView(data: data as WifiQRData));
              break;
            // case QRType.contact:
            //   Get.to(() => GenerateContactQRView(controller: controller));
            //   break;
            // case QRType.phone:
            //   Get.to(() => GeneratePhoneQRView(controller: controller));
            //   break;
            // case QRType.email:
            //   Get.to(() => GenerateEmailQRView(controller: controller));
            //   break;
            // case QRType.calendarEvent:
            //   Get.to(() => GenerateCalendarEventQRView(controller: controller));
            //   break;
            // case QRType.location:
            //   Get.to(() => GenerateLocationQRView(controller: controller));
            //   break;
            default:
              break;
          }

          // Navigate to the ScannedQRView after scanning the QR code.
          // Get.off(() => ScannedQRView(data: scanData));
          // Get.delete<QRCodeScannerController>();
        }
      },
    );
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
