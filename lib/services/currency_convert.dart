import 'dart:convert';

import 'package:currency_converts/constants/api.dart';
import 'package:http/http.dart' as http;

class CurrencyConvertService {
  Future<Map<String, dynamic>> getCurrency() async {
    final uri =
        Uri.https('api.hgbrasil.com', '/finance', {
          'key': ACCESS_KEY,
          'format': 'json'
        });
    http.Response response = await http.get(uri);
    return jsonDecode(response.body);
  }
}
