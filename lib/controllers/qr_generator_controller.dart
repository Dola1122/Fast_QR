import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fast_qr/views/generated_qr_view.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../utils/helpers/qr_data_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class QRGeneratorController extends GetxController {
  late QRDataHelper qrData;
  late String qrStringData;
  ScreenshotController screenshotController = ScreenshotController();

  // Function to generate the QR code and navigate to the QRCodeView
  void generateQRCode() {
    qrStringData = qrData.getRawDataString();

    // Navigate to the QRCodeView and pass the generated QR data as an argument
    Get.to(() => GeneratedQRView(
          qrData: qrStringData,
          controller: this,
        ));
  }

  Future<void> saveQRCode() async {
    try {
      final capturedImage = await screenshotController.captureFromWidget(
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(30.0),
          child: QrImageView(
            data: qrStringData,
            version: QrVersions.auto,
          ),
        ),
      );

      final result = await ImageGallerySaver.saveImage(capturedImage);

      if (result['isSuccess']) {
        print('Image saved to gallery');
      } else {
        print('Failed to save image to gallery');
      }
    } catch (e) {
      print('Error saving image: $e');
    }
  }
}
