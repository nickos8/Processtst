import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/poke_api_page_dto.dart';

class PokeApiService {
  static const String _baseUrl = 'https://pokeapi.co/api/v2';
  static const Duration _timeout = Duration(seconds: 15);

  Future<PokeApiPageDto> fetchPage({int limit = 20, int offset = 0}) async {
    final uri = Uri.parse('$_baseUrl/pokemon').replace(
      queryParameters: {'limit': limit.toString(), 'offset': offset.toString()},
    );

    final response = await http.get(uri).timeout(_timeout);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return PokeApiPageDto.fromJson(json);
    }

    throw Exception('Failed to fetch Pokemon list: ${response.statusCode}');
  }
}