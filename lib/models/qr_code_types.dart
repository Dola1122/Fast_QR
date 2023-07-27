abstract class QRData {
  String generateQRDataString();
}

// Plain Text
class TextQRData extends QRData {
  String text;

  TextQRData(this.text);

  @override
  String generateQRDataString() {
    return text;
  }
}

// URL
class URLQRData extends QRData {
  String url;

  URLQRData(this.url);

  @override
  String generateQRDataString() {
    return url;
  }
}

// WiFi
class WiFiQRData extends QRData {
  String ssid;
  String password;
  String encryptionType;

  WiFiQRData(this.ssid, this.password, this.encryptionType);

  @override
  String generateQRDataString() {
    return 'WIFI:S:$ssid;T:$encryptionType;P:$password;;';
  }
}

// Contact
class ContactQRData extends QRData {
  String fullName;
  String phoneNumber;
  String emailAddress;

  ContactQRData(this.fullName, this.phoneNumber, this.emailAddress);

  @override
  String generateQRDataString() {
    return 'BEGIN:VCARD\nVERSION:3.0\nFN:$fullName\nTEL:$phoneNumber\nEMAIL:$emailAddress\nEND:VCARD';
  }
}

// Phone
class PhoneQRData extends QRData {
  String phoneNumber;

  PhoneQRData(this.phoneNumber);

  @override
  String generateQRDataString() {
    return 'tel:$phoneNumber';
  }
}

// Email
class EmailQRData extends QRData {
  String emailAddress;

  EmailQRData(this.emailAddress);

  @override
  String generateQRDataString() {
    return 'mailto:$emailAddress';
  }
}

// Calendar Event
class CalendarEventQRData extends QRData {
  String eventSummary;
  String startDate;
  String endDate;
  String location;

  CalendarEventQRData(
      this.eventSummary, this.startDate, this.endDate, this.location);

  @override
  String generateQRDataString() {
    return 'BEGIN:VEVENT\nSUMMARY:$eventSummary\nDTSTART:$startDate\nDTEND:$endDate\nLOCATION:$location\nEND:VEVENT';
  }
}

// Location
class LocationQRData extends QRData {
  double latitude;
  double longitude;

  LocationQRData(this.latitude, this.longitude);

  @override
  String generateQRDataString() {
    return 'geo:$latitude,$longitude';
  }
}
