import 'dart:convert';


import 'package:cryptotracker/model/bitcoin_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;

class Services {
    List data = [];
  Future<List<BitcoinMockModel>> dataService() async {
    try {
      final response = await http
          .get(Uri.parse('https://648f4eea75a96b664444f9ee.mockapi.io/coins'));

      if (response.statusCode == 200) {
         data = jsonDecode(response.body);
        
        return data.map((e) => BitcoinMockModel.fromJson(e,"","","","")).toList();
        
        
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
