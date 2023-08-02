import 'package:fast_qr/utils/qr_type_enum.dart';

abstract class QRData {
  final QRType qRType;

  QRData({required this.qRType});

  Map<String, dynamic> fieldsToJson();

  String generateQRDataString();
}

// Plain Text
class TextQRData extends QRData {
  final String text;

  TextQRData({
    required this.text,
  }) : super(qRType: QRType.text);

  @override
  String generateQRDataString() {
    return text;
  }

  @override
  Map<String, dynamic> fieldsToJson() {
    return {
      "text": text,
    };
  }
}

// URL
class URLQRData extends QRData {
  final String url;

  URLQRData({
    required this.url,
  }) : super(qRType: QRType.url);

  @override
  String generateQRDataString() {
    return url;
  }

  @override
  Map<String, dynamic> fieldsToJson() {
    return {
      "url": url,
    };
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
  }) : super(qRType: QRType.wifi);

  @override
  String generateQRDataString() {
    return 'WIFI:S:$ssid;T:$encryptionType;P:$password;;';
  }

  @override
  Map<String, dynamic> fieldsToJson() {
    return {
      "ssid": ssid,
      "password": password,
      "encryptionType": encryptionType,
    };
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
  }) : super(qRType: QRType.contact);

  @override
  String generateQRDataString() {
    return 'BEGIN:VCARD\nVERSION:3.0\nFN:$fullName\nTEL:$phoneNumber\nEMAIL:$emailAddress\nEND:VCARD';
  }

  @override
  Map<String, dynamic> fieldsToJson() {
    return {
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "emailAddress": emailAddress,
    };
  }
}

// Phone
class PhoneQRData extends QRData {
  final String phoneNumber;

  PhoneQRData({
    required this.phoneNumber,
  }) : super(qRType: QRType.phone);

  @override
  String generateQRDataString() {
    return 'tel:$phoneNumber';
  }

  @override
  Map<String, dynamic> fieldsToJson() {
    return {
      "phoneNumber": phoneNumber,
    };
  }
}

// Email
class EmailQRData extends QRData {
  final String emailAddress;

  EmailQRData({
    required this.emailAddress,
  }) : super(qRType: QRType.email);

  @override
  String generateQRDataString() {
    return 'mailto:$emailAddress';
  }

  @override
  Map<String, dynamic> fieldsToJson() {
    return {"emailAddress": emailAddress};
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
  }) : super(qRType: QRType.calendarEvent);

  @override
  String generateQRDataString() {
    return 'BEGIN:VEVENT\nSUMMARY:$eventSummary\nDTSTART:$startDate\nDTEND:$endDate\nLOCATION:$location\nEND:VEVENT';
  }

  @override
  Map<String, dynamic> fieldsToJson() {
    return {
      "eventSummary": eventSummary,
      "startDate": startDate,
      "endDate": endDate,
      "location": location,
    };
  }
}

// Location
class LocationQRData extends QRData {
  final double latitude;
  final double longitude;

  LocationQRData({
    required this.latitude,
    required this.longitude,
  }) : super(qRType: QRType.location);

  @override
  String generateQRDataString() {
    return 'geo:$latitude,$longitude';
  }

  @override
  Map<String, dynamic> fieldsToJson() {
    return {
      "latitude": longitude,
      "longitude": longitude,
    };
  }
}
