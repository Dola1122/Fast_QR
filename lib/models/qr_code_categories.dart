import 'package:flutter/material.dart';

enum QRType {
  textQR,
  urlQR,
  wiFiQR,
  contactQR,
  phoneQR,
  emailQR,
  calendarEventQR,
  locationQR,
}

class QRCodeCategory {
  final String title;
  final IconData icon;
  final QRType qRType;

  QRCodeCategory({required this.title, required this.icon, required this.qRType});
}

final List<QRCodeCategory> qrCodeCategories = [
  QRCodeCategory(
    title: 'Plain Text',
    icon: Icons.text_fields,
    qRType: QRType.textQR,
  ),
  QRCodeCategory(
    title: 'URL',
    icon: Icons.link,
    qRType: QRType.urlQR,
  ),
  QRCodeCategory(
    title: 'WiFi',
    icon: Icons.wifi,
    qRType: QRType.wiFiQR,
  ),
  QRCodeCategory(
    title: 'Contact',
    icon: Icons.contacts,
    qRType: QRType.contactQR,
  ),
  QRCodeCategory(
    title: 'Phone',
    icon: Icons.phone,
    qRType: QRType.phoneQR,
  ),
  QRCodeCategory(
    title: 'Email',
    icon: Icons.email,
    qRType: QRType.emailQR,
  ),
  QRCodeCategory(
    title: 'Calendar Event',
    icon: Icons.event,
    qRType: QRType.calendarEventQR,
  ),
  QRCodeCategory(
    title: 'Location',
    icon: Icons.location_on,
    qRType: QRType.locationQR,
  ),
];
