import 'package:flutter/material.dart';

class QRCodeGeneratorView extends StatelessWidget {
  const QRCodeGeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generate QR Code')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // You can change this to adjust the number of columns
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: qrCodeTypes.length,
          itemBuilder: (context, index) {
            return _generateQRCodeCard(
              icon: qrCodeTypes[index].icon,
              title: qrCodeTypes[index].title,
              description: qrCodeTypes[index].description,
              generateQRCode: qrCodeTypes[index].generateQRCode,
            );
          },
        ),
      ),
    );
  }

  Widget _generateQRCodeCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback generateQRCode,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: generateQRCode,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 48),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}

class QRCodeType {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback generateQRCode;

  QRCodeType({
    required this.icon,
    required this.title,
    required this.description,
    required this.generateQRCode,
  });
}

final List<QRCodeType> qrCodeTypes = [
  QRCodeType(
    icon: Icons.text_fields,
    title: 'Plain Text QR Code',
    description: 'Generate QR code for simple text messages or information.',
    generateQRCode: () {
      // Logic to generate Plain Text QR Code
    },
  ),
  QRCodeType(
    icon: Icons.link,
    title: 'URL QR Code',
    description:
        'Generate QR code for linking users to websites or online resources.',
    generateQRCode: () {
      // Logic to generate URL QR Code
    },
  ),
  // Add more QR code types here
];
