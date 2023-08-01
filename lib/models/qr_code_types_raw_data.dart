import 'package:fast_qr/models/qr_type_enum.dart';

abstract class QRData {
  final QRType qRType;

  QRData({required this.qRType});

  String generateQRDataString();
}

// Plain Text
class TextQRData extends QRData {
  final String text;

  TextQRData({
    required this.text,
  }) : super(qRType: QRType.textQR);

  @override
  String generateQRDataString() {
    return text;
  }
}

// URL
class URLQRData extends QRData {
  final String url;

  URLQRData({
    required this.url,
  }) : super(qRType: QRType.urlQR);

  @override
  String generateQRDataString() {
    return url;
  }
}

// WiFi
class WiFiQRData extends QRData {
  final String ssid;
  final String password;
  final String encryptionType;

  WiFiQRData({
    required this.ssid,
    required this.password,
    required this.encryptionType,
  }) : super(qRType: QRType.wiFiQR);

  @override
  String generateQRDataString() {
    return 'WIFI:S:$ssid;T:$encryptionType;P:$password;;';
  }
}

// Contact
class ContactQRData extends QRData {
  final String fullName;
  final String phoneNumber;
  final String emailAddress;

  ContactQRData({
    required this.fullName,
    required this.phoneNumber,
    required this.emailAddress,
  }) : super(qRType: QRType.contactQR);

  @override
  String generateQRDataString() {
    return 'BEGIN:VCARD\nVERSION:3.0\nFN:$fullName\nTEL:$phoneNumber\nEMAIL:$emailAddress\nEND:VCARD';
  }
}

// Phone
class PhoneQRData extends QRData {
  final String phoneNumber;

  PhoneQRData({
    required this.phoneNumber,
  }) : super(qRType: QRType.phoneQR);

  @override
  String generateQRDataString() {
    return 'tel:$phoneNumber';
  }
}

// Email
class EmailQRData extends QRData {
  final String emailAddress;

  EmailQRData({
    required this.emailAddress,
  }) : super(qRType: QRType.emailQR);

  @override
  String generateQRDataString() {
    return 'mailto:$emailAddress';
  }
}

// Calendar Event
class CalendarEventQRData extends QRData {
  final String eventSummary;
  final String startDate;
  final String endDate;
  final String location;

  CalendarEventQRData({
    required this.eventSummary,
    required this.startDate,
    required this.endDate,
    required this.location,
  }) : super(qRType: QRType.calendarEventQR);

  @override
  String generateQRDataString() {
    return 'BEGIN:VEVENT\nSUMMARY:$eventSummary\nDTSTART:$startDate\nDTEND:$endDate\nLOCATION:$location\nEND:VEVENT';
  }
}

// Location
class LocationQRData extends QRData {
  final double latitude;
  final double longitude;

  LocationQRData({
    required this.latitude,
    required this.longitude,
  }) : super(qRType: QRType.locationQR);

  @override
  String generateQRDataString() {
    return 'geo:$latitude,$longitude';
  }
}
