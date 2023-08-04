import 'package:fast_qr/utils/qr_type_enum.dart';

abstract class QRDataHelper {
  final QRType qRType;

  QRDataHelper({required this.qRType});

  Map<String, dynamic> getJsonFields();

  String getRawDataString();
}

// Plain Text
class TextQRData extends QRDataHelper {
  final String text;

  TextQRData({
    required this.text,
  }) : super(qRType: QRType.text);

  @override
  String getRawDataString() {
    return text;
  }

  @override
  Map<String, dynamic> getJsonFields() {
    return {
      "text": text,
    };
  }
}

// URL
class URLQRData extends QRDataHelper {
  final String url;

  URLQRData({
    required this.url,
  }) : super(qRType: QRType.url);

  @override
  String getRawDataString() {
    return url;
  }

  @override
  Map<String, dynamic> getJsonFields() {
    return {
      "url": url,
    };
  }
}

// WiFi
class WiFiQRData extends QRDataHelper {
  final String ssid;
  final String password;
  final String encryptionType;

  WiFiQRData({
    required this.ssid,
    required this.password,
    required this.encryptionType,
  }) : super(qRType: QRType.wifi);

  @override
  String getRawDataString() {
    return 'WIFI:S:$ssid;T:$encryptionType;P:$password;;';
  }

  @override
  Map<String, dynamic> getJsonFields() {
    return {
      "ssid": ssid,
      "password": password,
      "encryptionType": encryptionType,
    };
  }
}

// Contact
class ContactQRData extends QRDataHelper {
  final String fullName;
  final String phoneNumber;
  final String emailAddress;

  ContactQRData({
    required this.fullName,
    required this.phoneNumber,
    required this.emailAddress,
  }) : super(qRType: QRType.contact);

  @override
  String getRawDataString() {
    return 'BEGIN:VCARD\nVERSION:3.0\nFN:$fullName\nTEL:$phoneNumber\nEMAIL:$emailAddress\nEND:VCARD';
  }

  @override
  Map<String, dynamic> getJsonFields() {
    return {
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "emailAddress": emailAddress,
    };
  }
}

// Phone
class PhoneQRData extends QRDataHelper {
  final String phoneNumber;

  PhoneQRData({
    required this.phoneNumber,
  }) : super(qRType: QRType.phone);

  @override
  String getRawDataString() {
    return 'tel:$phoneNumber';
  }

  @override
  Map<String, dynamic> getJsonFields() {
    return {
      "phoneNumber": phoneNumber,
    };
  }
}

// Email
class EmailQRData extends QRDataHelper {
  final String emailAddress;

  EmailQRData({
    required this.emailAddress,
  }) : super(qRType: QRType.email);

  @override
  String getRawDataString() {
    return 'mailto:$emailAddress';
  }

  @override
  Map<String, dynamic> getJsonFields() {
    return {"emailAddress": emailAddress};
  }
}

// Calendar Event
class CalendarEventQRData extends QRDataHelper {
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
  String getRawDataString() {
    return 'BEGIN:VEVENT\nSUMMARY:$eventSummary\nDTSTART:$startDate\nDTEND:$endDate\nLOCATION:$location\nEND:VEVENT';
  }

  @override
  Map<String, dynamic> getJsonFields() {
    return {
      "eventSummary": eventSummary,
      "startDate": startDate,
      "endDate": endDate,
      "location": location,
    };
  }
}

// Location
class LocationQRData extends QRDataHelper {
  final double latitude;
  final double longitude;

  LocationQRData({
    required this.latitude,
    required this.longitude,
  }) : super(qRType: QRType.location);

  @override
  String getRawDataString() {
    return 'geo:$latitude,$longitude';
  }

  @override
  Map<String, dynamic> getJsonFields() {
    return {
      "latitude": longitude,
      "longitude": longitude,
    };
  }
}
