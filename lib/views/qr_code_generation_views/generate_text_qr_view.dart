import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/qr_generator_controller.dart';
import '../../models/qr_code_types_raw_data.dart';

class GenerateTextQRView extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  final QRGeneratorController controller;

  GenerateTextQRView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Type: Plain Text',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Enter Text'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String text = textController.text;
                // Generate the QR code based on qrData using TextQRData
                controller.qrData = TextQRData(text: text);
                controller.generateQRCode();
              },
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
