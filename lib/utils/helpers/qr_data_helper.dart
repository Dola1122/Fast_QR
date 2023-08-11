import 'package:fast_qr/utils/helpers/qr_type_helper.dart';
import 'package:fast_qr/utils/qr_type_enum.dart';

abstract class QRData {
  QRType get type;

  Map<String, String> get fields;

  String get dataString;

  factory QRData.fromDataString(String dataString) {
    QRTypeHelper qrTypeHelper = QRTypeHelper();
    QRType qrType = qrTypeHelper.getQRCodeType(dataString);

    switch (qrType) {
      case QRType.text:
        return TextQRData.fromDataString(dataString);
      case QRType.url:
        return UrlQRData.fromDataString(dataString);
      case QRType.wifi:
        return WifiQRData.fromDataString(dataString);
      case QRType.contact:
        return ContactQRData.fromDataString(dataString);
      case QRType.phone:
        return PhoneQRData.fromDataString(dataString);
      case QRType.email:
        return EmailQRData.fromDataString(dataString);
      case QRType.calendarEvent:
        return CalendarEventQRData.fromDataString(dataString);
      case QRType.location:
        return LocationQRData.fromDataString(dataString);
      default:
        throw ArgumentError('Invalid QRType');
    }
  }
}

// Plain Text
class TextQRData implements QRData {
  final String text;

  TextQRData({
    required this.text,
  });

  factory TextQRData.fromDataString(String dataString) {
    return TextQRData(text: dataString);
  }

  @override
  QRType get type => QRType.text;

  @override
  String get dataString => text;

  @override
  Map<String, String> get fields => {
        "text": text,
      };
}

// WiFi
class WifiQRData implements QRData {
  final String ssid;
  final String encryptionType;
  final String password;

  WifiQRData({
    required this.ssid,
    required this.encryptionType,
    required this.password,
  });

  factory WifiQRData.fromDataString(String dataString) {
    final parts = dataString.split(';');
    if (parts.length != 4) {
      throw const FormatException('Invalid WiFi QR data string');
    }

    final ssid = parts[1].split(':')[2];
    final encryptionType = parts[2].split(':')[1];
    final password = parts[3].split(':')[1];

    return WifiQRData(
      ssid: ssid,
      encryptionType: encryptionType,
      password: password,
    );
  }

  @override
  QRType get type => QRType.wifi;

  @override
  String get dataString => 'WIFI:S:$ssid;T:$encryptionType;P:$password;;';

  @override
  Map<String, String> get fields => {
        "ssid": ssid,
        "encryptionType": encryptionType,
        "password": password,
      };
}

class UrlQRData implements QRData {
  final String url;

  UrlQRData({
    required this.url,
  });

  factory UrlQRData.fromDataString(String dataString) {
    final url = dataString;
    return UrlQRData(
      url: url,
    );
  }

  @override
  QRType get type => QRType.url;

  @override
  String get dataString => url;

  @override
  Map<String, String> get fields => {
        "url": url,
      };
}

class ContactQRData implements QRData {
  final String fullName;
  final String phoneNumber;
  final String emailAddress;

  ContactQRData({
    required this.fullName,
    required this.phoneNumber,
    required this.emailAddress,
  });

  factory ContactQRData.fromDataString(String dataString) {
    final lines = dataString.split('\n');
    final fullName = lines[2].split(':')[1];
    final phoneNumber = lines[3].split(':')[1];
    final emailAddress = lines[4].split(':')[1];

    return ContactQRData(
      fullName: fullName,
      phoneNumber: phoneNumber,
      emailAddress: emailAddress,
    );
  }

  @override
  QRType get type => QRType.contact;

  @override
  String get dataString =>
      'BEGIN:VCARD\nVERSION:3.0\nFN:$fullName\nTEL:$phoneNumber\nEMAIL:$emailAddress\nEND:VCARD';

  @override
  Map<String, String> get fields => {
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "emailAddress": emailAddress,
      };
}

class PhoneQRData implements QRData {
  final String phoneNumber;

  PhoneQRData({
    required this.phoneNumber,
  });

  factory PhoneQRData.fromDataString(String dataString) {
    final phoneNumber = dataString.split(':')[1];
    return PhoneQRData(
      phoneNumber: phoneNumber,
    );
  }

  @override
  QRType get type => QRType.phone;

  @override
  String get dataString => 'tel:$phoneNumber';

  @override
  Map<String, String> get fields => {
        "phoneNumber": phoneNumber,
      };
}

class EmailQRData implements QRData {
  final String emailAddress;

  EmailQRData({
    required this.emailAddress,
  });

  factory EmailQRData.fromDataString(String dataString) {
    final emailAddress = dataString.split(':')[1];
    return EmailQRData(
      emailAddress: emailAddress,
    );
  }

  @override
  QRType get type => QRType.email;

  @override
  String get dataString => 'mailto:$emailAddress';

  @override
  Map<String, String> get fields => {
        "emailAddress": emailAddress,
      };
}

class CalendarEventQRData implements QRData {
  final String eventSummary;
  final String startDate;
  final String endDate;
  final String location;

  CalendarEventQRData({
    required this.eventSummary,
    required this.startDate,
    required this.endDate,
    required this.location,
  });

  factory CalendarEventQRData.fromDataString(String dataString) {
    final lines = dataString.split('\n');
    final eventSummary = lines[1].split(':')[1];
    final startDate = lines[2].split(':')[1];
    final endDate = lines[3].split(':')[1];
    final location = lines[4].split(':')[1];

    return CalendarEventQRData(
      eventSummary: eventSummary,
      startDate: startDate,
      endDate: endDate,
      location: location,
    );
  }

  @override
  QRType get type => QRType.calendarEvent;

  @override
  String get dataString =>
      'BEGIN:VEVENT\nSUMMARY:$eventSummary\nDTSTART:$startDate\nDTEND:$endDate\nLOCATION:$location\nEND:VEVENT';

  @override
  Map<String, String> get fields => {
        "eventSummary": eventSummary,
        "startDate": startDate,
        "endDate": endDate,
        "location": location,
      };
}

class LocationQRData implements QRData {
  final double latitude;
  final double longitude;

  LocationQRData({
    required this.latitude,
    required this.longitude,
  });

  factory LocationQRData.fromDataString(String dataString) {
    final parts = dataString.split(':');
    final latitude = double.parse(parts[1]);
    final longitude = double.parse(parts[2]);
    return LocationQRData(
      latitude: latitude,
      longitude: longitude,
    );
  }

  @override
  QRType get type => QRType.location;

  @override
  String get dataString => 'geo:$latitude,$longitude';

  @override
  Map<String, String> get fields => {
        "latitude": latitude.toString(),
        "longitude": longitude.toString(),
      };
}
