import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';
import '../controllers/qr_code_scanner_controller.dart';

class QRCodeScannerView extends StatelessWidget {
  const QRCodeScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan QR Code',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
      ),
      body: GetX<QRCodeScannerController>(
        init: Get.find<QRCodeScannerController>(),
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    QRView(
                      key: controller.qrKey,
                      onQRViewCreated: controller.onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: Colors.red,
                        borderRadius: 10,
                        borderLength: 30,
                        borderWidth: 10,
                      ),
                      onPermissionSet: _onPermissionSet,
                    ),
                    Column(
                      children: [
                        Expanded(child: SizedBox()),
                        Padding(
                          padding: EdgeInsets.all(24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () => controller.toggleFlash(),
                                  icon: Icon(
                                    controller.isFlashOn.value
                                        ? Icons.flash_on
                                        : Icons.flash_off,
                                  ),
                                  color: Colors.black, // Customize icon color if needed
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () => controller.flipCamera(),
                                  icon: Icon(
                                    controller.isBackCamera.value
                                        ? Icons.camera_rear
                                        : Icons.camera_front,
                                  ),
                                  color: Colors.black, // Customize icon color if needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

void _onPermissionSet(QRViewController ctrl, bool p) {
  log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
  if (!p) {
    log('no Permission');
  }
}
