/// Api den gelen gün id lerine göre uazıldı
extension GetDay on DateTime {
  String getDayId() {
    switch (weekday) {
      case DateTime.monday:
        return '1';
      case DateTime.tuesday:
        return '2';
      case DateTime.wednesday:
        return '3';
      case DateTime.thursday:
        return '4';
      case DateTime.friday:
        return '5';
      case DateTime.saturday:
        return '6';
      case DateTime.sunday:
        return '7';
      default:
        return '1';
    }
  }
}
