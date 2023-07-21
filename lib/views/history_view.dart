import 'package:flutter/material.dart';

import '../models/qr_history_item_model.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Generate QR Code',
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
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Scanner'),
              Tab(text: 'Generated'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildScannerHistory(),
            _buildGeneratedHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildScannerHistory() {
    final List<QRHistoryItemModel> qrCodeScannerHistoryData = [
      QRHistoryItemModel(
        icon: Icons.text_fields,
        title: 'Plain Text QR Code',
        isFavorite: true,
      ),
      QRHistoryItemModel(
        icon: Icons.link,
        title: 'URL QR Code',
        isFavorite: false,
      ),
      QRHistoryItemModel(
        icon: Icons.wifi,
        title: 'WiFi QR Code',
        isFavorite: true,
      ),
      // Add more sample scanned QR codes here
    ];

    return ListView.builder(
      itemCount: qrCodeScannerHistoryData.length,
      itemBuilder: (context, index) {
        final QRHistoryItemModel qrCode = qrCodeScannerHistoryData[index];
        return ListTile(
          leading: Icon(qrCode.icon),
          title: Text(qrCode.title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  // Logic to add/remove from favorites
                },
                icon: Icon(
                  qrCode.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Logic to edit the QR code
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGeneratedHistory() {
    final List<QRHistoryItemModel> qrCodeGeneratedHistoryData = [
      QRHistoryItemModel(
        icon: Icons.link,
        title: 'URL QR Code',
        isFavorite: false,
      ),
      QRHistoryItemModel(
        icon: Icons.wifi,
        title: 'WiFi QR Code',
        isFavorite: true,
      ),
      // Add more sample scanned QR codes here
    ];

    return ListView.builder(
      itemCount: qrCodeGeneratedHistoryData.length,
      itemBuilder: (context, index) {
        final QRHistoryItemModel qrCode = qrCodeGeneratedHistoryData[index];
        return ListTile(
          leading: Icon(qrCode.icon),
          title: Text(qrCode.title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  // Logic to add/remove from favorites
                },
                icon: Icon(
                  qrCode.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Logic to edit the QR code
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
        );
      },
    );
  }
}
