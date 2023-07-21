import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../blocs/qr_code_scanner_bloc.dart';
import '../blocs/qr_code_scanner_state.dart';

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
      body: BlocConsumer<QRCodeScannerCubit, QRCodeScannerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    QRView(
                      key: BlocProvider.of<QRCodeScannerCubit>(context).qrKey,
                      onQRViewCreated:
                          BlocProvider.of<QRCodeScannerCubit>(context)
                              .onQRViewCreated,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              child: IconButton(
                                onPressed: () =>
                                    BlocProvider.of<QRCodeScannerCubit>(context)
                                        .toggleFlash(),
                                icon: Icon(
                                  BlocProvider.of<QRCodeScannerCubit>(context)
                                          .state is QRCodeScannerFlashOnState
                                      ? Icons.flash_on
                                      : Icons.flash_off,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(8),
                              child: IconButton(
                                onPressed: () =>
                                    BlocProvider.of<QRCodeScannerCubit>(context)
                                        .flipCamera(),
                                icon: Icon(
                                  BlocProvider.of<QRCodeScannerCubit>(context)
                                          .state is QRCodeScannerBackCameraState
                                      ? Icons.camera_rear
                                      : Icons.camera_front,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (BlocProvider.of<QRCodeScannerCubit>(context).result !=
                        null)
                      Text(
                        'Barcode Type: ${describeEnum(BlocProvider.of<QRCodeScannerCubit>(context).result!.format)}   Data: ${BlocProvider.of<QRCodeScannerCubit>(context).result!.code}',
                      )
                    else
                      Text('Scan a code'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade200,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Scan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Generate'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Logic to navigate between views
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
