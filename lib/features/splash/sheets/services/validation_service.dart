class ValidationService {
  // Валидация номера
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty || value.length < 16) {
      return 'Введите номер телефона';
    }
    return null;
  }

  // Валидация карты
  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty || value.length < 19) {
      return 'Заполните поле';
    }
    return null;
  }

  // Валидация пинкода
  static String? validatePinCode(String? value) {
    if (value == null || value.isEmpty || value.length < 4) {
      return 'Заполните поле';
    }
    return null;
  }
}
