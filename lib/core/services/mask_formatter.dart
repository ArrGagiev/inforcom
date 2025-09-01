import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormatter {
  static MaskTextInputFormatter phoneNumber = MaskTextInputFormatter(
    mask: '+7 ### ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static MaskTextInputFormatter cardNumber = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  // Метод для получения чистого номера телефона (10 цифр после +7)
  static String? getCleanPhoneNumber(String? phoneWithMask) {
    if (phoneWithMask == null || phoneWithMask.isEmpty) return null;
    final cleanNumber = phoneWithMask.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanNumber.length >= 11 &&
        (cleanNumber.startsWith('7') || cleanNumber.startsWith('8'))) {
      return cleanNumber.substring(1, 11);
    }
    return null;
  }

  // Метод для получения чистого номера карты (16 цифр)
  static String? getCleanCardNumber(String? cardWithMask) {
    if (cardWithMask == null || cardWithMask.isEmpty) return null;
    final cleanNumber = cardWithMask.replaceAll(' ', '');
    if (cleanNumber.length == 16) {
      return cleanNumber;
    }
    return null;
  }
}
