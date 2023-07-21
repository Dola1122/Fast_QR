import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerViewModel {
  Barcode? result;
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
    });
  }

  Future<void> toggleFlash() async {
    await controller?.toggleFlash();
  }

  Future<bool?> getFlashStatus() async {
    return controller?.getFlashStatus();
  }

  Future<void> flipCamera() async {
    await controller?.flipCamera();
  }

  Future<CameraFacing?> getCameraInfo() async {
    return controller?.getCameraInfo();
  }

  Future<void> pauseCamera() async {
    await controller?.pauseCamera();
  }

  Future<void> resumeCamera() async {
    await controller?.resumeCamera();
  }

  void dispose() {
    controller?.dispose();
  }
}
