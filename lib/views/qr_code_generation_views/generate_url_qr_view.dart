import 'package:flutter/material.dart';

class GenerateURLQRView extends StatelessWidget {
  final TextEditingController urlController = TextEditingController();

  GenerateURLQRView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR Code Type: URL',
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
              controller: urlController,
              decoration: InputDecoration(labelText: 'Enter URL'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String url = urlController.text;
                // Generate the QR code based on url using URLQRData
              },
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
