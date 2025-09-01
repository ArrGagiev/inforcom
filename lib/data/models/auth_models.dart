import 'package:inforcom/core/services/mask_formatter.dart';

class LoginStep1Request {
  final String phone;
  final String cardno;
  final String pin;

  LoginStep1Request({
    required this.phone,
    required this.cardno,
    required this.pin,
  });

  Map<String, dynamic> toJson() => {
    'phone': MaskFormatter.getCleanPhoneNumber(phone),
    'cardno': MaskFormatter.getCleanCardNumber(cardno),
    'pin': pin,
  };
}

class LoginStep1Response {
  final bool success;
  final LoginData data;

  LoginStep1Response({required this.success, required this.data});

  factory LoginStep1Response.fromJson(Map<String, dynamic> json) =>
      LoginStep1Response(
        success: json['success'] ?? false,
        data: LoginData.fromJson(json['data'] ?? {}),
      );
}

class LoginData {
  final String temporaryToken;

  LoginData({required this.temporaryToken});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      LoginData(temporaryToken: json['temporary_token'] ?? '');
}

//------------------------------------------------------------------
//------------------------------------------------------------------

class LoginStep2Request {
  final String temporaryToken;
  final String verificationCode;

  LoginStep2Request({
    required this.temporaryToken,
    required this.verificationCode,
  });

  Map<String, dynamic> toJson() => {
    'temporary_token': temporaryToken,
    'verification_code': verificationCode,
  };
}

class LoginStep2Response {
  final String accessToken;
  final String? secret;

  LoginStep2Response({required this.accessToken, this.secret});

  factory LoginStep2Response.fromJson(Map<String, dynamic> json) =>
      LoginStep2Response(
        accessToken: json['access_token'] ?? '',
        secret: json['secret'],
      );
}
