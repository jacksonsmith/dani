import 'dart:convert';

import 'package:http/http.dart' as http;

/// Serviço que chama a API mockada para validar o valor do IPTU.
/// Requer o backend rodando em http://localhost:3000
class IptuValidateApiService {
  IptuValidateApiService({this.baseUrl = 'http://localhost:3000'});

  final String baseUrl;

  Future<IptuValidateResult> validate(double value) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/validate-iptu'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'value': value}),
    );

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return IptuValidateResult(
        valid: data['valid'] as bool,
        value: (data['value'] as num?)?.toDouble(),
        message: data['message'] as String? ?? '',
      );
    }

    return IptuValidateResult(
      valid: false,
      message: data['message'] as String? ?? 'Erro ao validar. Tente novamente.',
    );
  }
}

class IptuValidateResult {
  IptuValidateResult({
    required this.valid,
    this.value,
    this.message = '',
  });

  final bool valid;
  final double? value;
  final String message;
}
