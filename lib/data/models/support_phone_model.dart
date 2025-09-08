class SupportPhoneModel {
  final int id;
  final String phone;

  SupportPhoneModel({required this.id, required this.phone});

  factory SupportPhoneModel.fromJson(Map<String, dynamic> json) {
    return SupportPhoneModel(id: json['id'] ?? 0, phone: json['phone'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'phone': phone};
  }
}

class SupportResponse {
  final bool success;
  final List<SupportPhoneModel> data;

  SupportResponse({required this.success, required this.data});

  factory SupportResponse.fromJson(Map<String, dynamic> json) {
    return SupportResponse(
      success: json['success'] ?? false,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((item) => SupportPhoneModel.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
