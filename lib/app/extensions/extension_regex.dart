/// written for validate the characters in edit text
/// written this Extensions for String class
extension TSRegEx on String {
  //for validate Email
  String? isMail() {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (isEmpty) {
      return 'Eposta adresi giriniz.';
    } else if (!regExp.hasMatch(this)) {
      return 'Geçerli eposta adresi giriniz.';
    }
    return null;
  }

  //for validate phone numbers
  String? isTelNo() {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = RegExp(pattern);
    if (length == 0) {
      return 'Telefon numarası giriniz.';
    } else if (!regExp.hasMatch(this)) {
      return 'Geçerli telefon numarası giriniz.';
    }
    return null;
  }

  //for validate activation code
  String? isActCode() {
    String pattern = r'(^(?:[+0]9)?[0-9]{6}$)';
    RegExp regExp = RegExp(pattern);
    if (isEmpty) {
      return 'Kod giriniz.';
    } else if (length != 6) {
      return '6 Karekter kodunuzu giriniz.';
    } else if (!regExp.hasMatch(this)) {
      return 'Kodu kontrol ediniz.';
    }
    return null;
  }

  //for validate activation code
  String? isQRCode() {
    String pattern = r'^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$';
    RegExp regExp = RegExp(pattern);
    if (length < 8) {
      return 'Geçerli kod giriniz.';
    } else if (length > 16) {
      return 'Geçerli kod giriniz.';
    } else if (!regExp.hasMatch(this)) {
      return 'Geçerli kod giriniz.';
    }
    return null;
  }

  //for validate name
  String? isName() {
    String pattern =
        r"^[a-zA-Z-üğişçöĞÜİŞÇÖıI]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regExp = RegExp(pattern);
    if (isEmpty) {
      return 'Ad giriniz.';
    } else if (length == 1) {
      return 'Geçerli ad giriniz.';
    } else if (!regExp.hasMatch(this)) {
      return 'Geçerli ad giriniz.';
    }
    return null;
  }

  //for validate
  String? isPassword() {
    if (isEmpty) {
      return 'Şifre giriniz.';
    } else if (length < 6) {
      return 'Şifreniz en az 6 karekter olması gerek.';
    }
    return null;
  }

  String? isAddressValidator() {
    if (isEmpty) {
      return "";
    }
    return null;
  }

  String? isNotEmptyController() {
    if (isEmpty) {
      return 'Zorunlu alan.';
    }
    return null;
  }

  String? isCreditCardNumber() {
    if (isEmpty) {
      return 'Zorunlu alan.';
    } else if (length < 16) {
      return 'Geçerli kart numarası giriniz.';
    }
    return null;
  }

  String? isCreditCardDate() {
    if (isEmpty) {
      return 'Zorunlu alan.';
    } else if (length < 4) {
      return 'Geçerli tarih girin.';
    } else if (int.parse(substring(0, 2)) > 12) {
      return 'Geçerli tarih girin.';
    } else if (int.parse(substring(2)) < 21) {
      return 'Geçerli tarih girin.';
    }
    return null;
  }

  String? isCreditCardCVV() {
    if (isEmpty) {
      return 'Zorunlu alan.';
    } else if (length < 3) {
      return 'Geçerli şifre giriniz.';
    }
    return null;
  }
}
