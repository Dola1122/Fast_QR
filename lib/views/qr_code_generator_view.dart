import 'package:fast_qr/views/qr_code_generation_views/generate_calender_event_qr_view.dart';
import 'package:fast_qr/views/qr_code_generation_views/generate_contact_qr_view.dart';
import 'package:fast_qr/views/qr_code_generation_views/generate_email_qr_view.dart';
import 'package:fast_qr/views/qr_code_generation_views/generate_location_qr_view.dart';
import 'package:fast_qr/views/qr_code_generation_views/generate_phone_qr_view.dart';
import 'package:fast_qr/views/qr_code_generation_views/generate_text_qr_view.dart';
import 'package:fast_qr/views/qr_code_generation_views/generate_url_qr_view.dart';
import 'package:fast_qr/views/qr_code_generation_views/generate_wifi_qr_view.dart';
import 'package:flutter/material.dart';
import '../controllers/qr_generator_controller.dart';
import '../models/qr_code_categories.dart';
import 'package:get/get.dart';

class QRCodeGeneratorView extends StatelessWidget {
  QRCodeGeneratorView({Key? key}) : super(key: key);

  QRGeneratorController controller = Get.put(QRGeneratorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // You can change this to adjust the number of columns
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: qrCodeCategories.length,
          itemBuilder: (context, index) {
            return _generateQRCodeCard(
              category: qrCodeCategories[index],
            );
          },
        ),
      ),
      backgroundColor: Colors.blue.shade50,
    );
  }

  Widget _generateQRCodeCard({
    required QRCodeCategory category,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          onTapCategory(category.qRType, controller);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(category.icon),
            SizedBox(height: 8),
            Text(
              category.title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

void onTapCategory(QRType type, QRGeneratorController controller) {
  switch (type) {
    case QRType.textQR:
      Get.to(() => GenerateTextQRView(controller: controller));
      break;
    case QRType.urlQR:
      Get.to(() => GenerateURLQRView(controller: controller));
      break;
    case QRType.wiFiQR:
      Get.to(() => GenerateWiFiQRView(controller: controller));
      break;
    case QRType.contactQR:
      Get.to(() => GenerateContactQRView(controller: controller));
      break;
    case QRType.phoneQR:
      Get.to(() => GeneratePhoneQRView(controller: controller));
      break;
    case QRType.emailQR:
      Get.to(() => GenerateEmailQRView(controller: controller));
      break;
    case QRType.calendarEventQR:
      Get.to(() => GenerateCalendarEventQRView(controller: controller));
      break;
    case QRType.locationQR:
      Get.to(() => GenerateLocationQRView(controller: controller));
      break;
  }
}
