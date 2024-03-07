import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/model/model2.dart';

//page değeri için bir stateprovider atadık bu şekilde butona bastığımızda sayfa değiiecek
final pageNumberProvider = StateProvider<int>((ref) => 1);

Future<RickMorty> getData(int pageNumber) async {
  String url = "https://rickandmortyapi.com/api/character/?page=$pageNumber";
  try {
    final resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      var data = RickMorty.fromJson(jsonDecode(resp.body));

      return data;
    } else {
      throw Exception("gelmedi");
    }
  } catch (e) {
    throw Exception("gelmedi hata $e");
  }
}

//future provider kullandık çünkü gelicek olan datalar async olarak gelen data
final responseProvider = FutureProvider<RickMorty>((ref) async {
  final pageNumber = ref.watch(pageNumberProvider);
  return getData(pageNumber);
});
