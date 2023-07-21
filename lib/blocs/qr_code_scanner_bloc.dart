import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'qr_code_scanner_state.dart';

class QRCodeScannerCubit extends Cubit<QRCodeScannerState> {
  QRViewController? controller;
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRCodeScannerCubit() : super(QRCodeScannerInitialState());

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      emit(QRCodeScannerScanningState(result!));
    });
  }


  Future<void> toggleFlash() async {
    await controller?.toggleFlash();
    emit(await controller?.getFlashStatus() == true
        ? QRCodeScannerFlashOnState()
        : QRCodeScannerFlashOffState());
  }

  Future<void> flipCamera() async {
    await controller?.flipCamera();
    emit(await controller?.getCameraInfo() == CameraFacing.back
        ? QRCodeScannerBackCameraState()
        : QRCodeScannerFrontCameraState());
  }


  @override
  Future<void> close() {
    controller?.dispose();
    return super.close();
  }
}
