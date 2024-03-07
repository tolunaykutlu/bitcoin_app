import 'dart:convert';

import 'package:cryptotracker/model/bitcoin_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;

class Services {
  List<BitcoinMockModel> datas = [];
  Future<BitcoinMockModel> dataService() async {
    try {
      final response = await http
          .get(Uri.parse('https://648f4eea75a96b664444f9ee.mockapi.io/coins'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        return BitcoinMockModel.fromMap(data);
      } else {
        throw Exception('Veri yüklenirken hata oluştu: ${response.statusCode}');
      }
    } catch (exception) {
      throw Exception('Veri yüklenirken hata oluştu: $exception');
    }
  }
}

final serviceProvider = Provider((ref) {
  return Services();
});
