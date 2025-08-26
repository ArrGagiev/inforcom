class AppRoutes {
  static const String splash = '/splash';

  static const String main = '/main';
  static const String map = '/map';
  static const String promo = '/promo';
  static const String support = '/support';
  static const String profile = '/profile';

  // Подмаршруты профиля
  // Страница добавления топливной карты
  static const String addCard = 'add-card';
  static String get addCardFull => '$profile/$addCard';

  // Подмаршруты акций
  // Страница акции - детально
  static const String promoDetails = 'promo-details';
  static String get promoDetailsFull => '$promo/$promoDetails';
}
