import 'package:fast_qr/views/qr_code_generator_view.dart';
import 'package:fast_qr/views/qr_code_scanner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/qr_code_scanner_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QRCodeScannerCubit>(
            create: (context) => QRCodeScannerCubit()),
      ],
      child: MaterialApp(
        title: 'QR Code Scanner App',
        home:
            QRCodeGeneratorView(),
            // QRCodeScannerView(),
      ),
    );
  }
}
