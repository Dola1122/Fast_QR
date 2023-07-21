import 'package:equatable/equatable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// Base state class
abstract class QRCodeScannerState extends Equatable {
  const QRCodeScannerState();

  @override
  List<Object?> get props => [];
}

// State class for initial state
class QRCodeScannerInitialState extends QRCodeScannerState {}

// State class for scanning state
class QRCodeScannerScanningState extends QRCodeScannerState {
  final Barcode result;

  const QRCodeScannerScanningState(this.result);

  @override
  List<Object?> get props => [result];
}

// State class for flash on state
class QRCodeScannerFlashOnState extends QRCodeScannerState {}

// State class for flash off state
class QRCodeScannerFlashOffState extends QRCodeScannerState {}

// State class for front camera state
class QRCodeScannerFrontCameraState extends QRCodeScannerState {}

// State class for back camera state
class QRCodeScannerBackCameraState extends QRCodeScannerState {}
