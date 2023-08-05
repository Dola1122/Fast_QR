import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';
import '../controllers/qr_generator_controller.dart';

class GeneratedQRView extends StatelessWidget {
  final String qrData;
  final QRGeneratorController controller;

  GeneratedQRView({
    super.key,
    required this.qrData,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Code")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20),
            Text(
              'Scanned QR Code Data:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              qrData,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await controller.saveQRCode();
              }, // Call the function to save QR code
              child: Text("Save QR Code"),
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.shareQRCode();
              }, // Call the function to save QR code
              child: Text("Share QR Code"),
            ),
          ],
        ),
      ),
    );
  }
}
