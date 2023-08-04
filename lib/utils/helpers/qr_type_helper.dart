import '../qr_type_enum.dart';


class QRTypeHelper {

  QRType getQRCodeType(String qrData) {
    if (_isURL(qrData)) {
      return QRType.url;
    } else if (_isEmail(qrData)) {
      return QRType.email;
    } else if (_isPhone(qrData)) {
      return QRType.phone;
    } else if (_isWiFi(qrData)) {
      return QRType.wifi;
    } else if (_isCalendarEvent(qrData)) {
      return QRType.calendarEvent;
    } else if (_isLocation(qrData)) {
      return QRType.location;
    }else if (_isContact(qrData)) {
      return QRType.contact;
    }
    // else if (_isSMS(qrData)) {
    //   return QRType.sms;
    // } else if (_isVCalendar(qrData)) {
    //   return QRType.vCalendar;
    // } else if (_isDocumentLink(qrData)) {
    //   return QRType.documentLink;
    // }
    else {
      return QRType.text;
    }
  }

// URL
  bool _isURL(String qrData) {
    return qrData.startsWith(RegExp(r'https?://'));
  }

// Email
  bool _isEmail(String qrData) {
    return qrData.startsWith('mailto:');
  }

// Phone
  bool _isPhone(String qrData) {
    return qrData.startsWith('tel:');
  }

// WiFi
  bool _isWiFi(String qrData) {
    return qrData.startsWith('WIFI:');
  }

// Calendar Event
  bool _isCalendarEvent(String qrData) {
    return qrData.startsWith('BEGIN:VEVENT');
  }

// Location
  bool _isLocation(String qrData) {
    return qrData.startsWith('geo:');
  }


// Contact
  bool _isContact(String qrData) {
    return qrData.startsWith('MECARD:') ||
        qrData.startsWith('BIZCARD:') ||
        qrData.startsWith('vCard:');
  }

// SMS
  bool _isSMS(String qrData) {
    return qrData.startsWith('sms:') ||
        qrData.startsWith('SMSTO:') ||
        qrData.startsWith('smsto:');
  }

// vCalendar
  bool _isVCalendar(String qrData) {
    return qrData.startsWith('BEGIN:VCALENDAR');
  }

// Document Link (Custom detection logic needed)
  bool _isDocumentLink(String qrData) {
    return qrData.startsWith('DOCUMENT_LINK:');
  }

}
