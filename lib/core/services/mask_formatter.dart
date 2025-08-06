import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormatter {
  static MaskTextInputFormatter appMaskFormatter = MaskTextInputFormatter(
    mask: '+7 ### ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}