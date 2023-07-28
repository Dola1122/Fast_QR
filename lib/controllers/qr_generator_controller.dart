import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fast_qr/views/generated_qr_view.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../models/qr_code_types.dart';
import 'package:permission_handler/permission_handler.dart';

class QRGeneratorController extends GetxController {
  late QRData qrData;
  late String qrStringData;

  // Function to generate the QR code and navigate to the QRCodeView
  void generateQRCode() {
    qrStringData = qrData.generateQRDataString();

    // Navigate to the QRCodeView and pass the generated QR data as an argument
    Get.to(() => GeneratedQRView(
          qrData: qrStringData,
          controller: this,
        ));
  }

  Future<void> saveQRCode() async {
    try {
      // Check for permission to save images to the gallery
      final permissionStatus = await Permission.storage.request();
      if (!permissionStatus.isGranted) {
        print('Permission to save images to gallery denied.');
        return;
      }

      // Save the QR code image to the device's gallery
      final ByteData? qrImageData = await QrPainter(
        data: qrStringData,
        version: QrVersions.auto,
      ).toImageData(200.0, format: ui.ImageByteFormat.png);

      if (qrImageData != null) {
        final Uint8List bytes = qrImageData.buffer.asUint8List();
        final result = await ImageGallerySaver.saveImage(bytes);
        if (result['isSuccess']) {
          // Image saved successfully
          print('QR Code image saved successfully!');
        } else {
          // Image saving failed
          print('Failed to save QR Code image.');
        }
      } else {
        // Error: QR code image data is null
        print('Error: QR code image data is null');
      }
    } catch (e) {
      // Error occurred while saving
      print('Error while saving QR Code image: $e');
    }
  }
}
