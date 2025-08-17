class AppRoutes {
  static const String main = '/main';
  static const String map = '/map';
  static const String promo = '/promo';
  static const String support = '/support';
  static const String profile = '/profile';

  // Подмаршруты профиля
  // Страница добавления топливной карты
  static const String addCard = 'add-card';
  static String get addCardFull => '$profile/$addCard';
}
