import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'control_view.dart';
import 'qr_code_scanner_view.dart';

class ScannedQRView extends StatelessWidget {
  final Barcode? data;

  const ScannedQRView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Execute custom logic when the Android back button is pressed
        Get.off(() => ControlView());
        return true; // Return true to allow the back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scanned QR Code'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the QRCodeScannerView when the back button in the AppBar is clicked
              Get.off(() => QRCodeScannerView());
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (data != null)
                QrImageView(
                  data: data!.code!,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              SizedBox(height: 20),
              Text(
                'Scanned QR Code Data:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '${(data!.code) ?? ""}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}