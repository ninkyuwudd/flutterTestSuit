class Images {
  static String get backArrow => 'backArrow'.png;
  static String get background => 'background'.png;
  static String get emptyPhoto => 'emptyProfile'.png;
}

extension on String {
  String get png => 'assets/images/$this.png';
}
