extension EnumTransform on List {
  String? string<T>(T value) {
    if (value == null || (isEmpty)) return null;
    var occurence = singleWhere(
        (enumItem) => enumItem.toString() == value.toString(),
        orElse: () => null);
    if (occurence == null) return null;
    return occurence.toString().split('.').last;
  }

//TODO: 오류 계속 발생하는 부분임 체크하기
  T enumFromString<T>(String value) {
    return firstWhere((type) => type.toString().split('.').last == value,
        orElse: () => null);
  }
}

extension ParseToMiliseconds on DateTime {
  int toMilliseconds() {
    return this.millisecondsSinceEpoch;
  }
}

extension ParseToDatetime on int {
  DateTime toDatetime() {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }
}
