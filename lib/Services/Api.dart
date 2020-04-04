import 'dart:convert';

import 'package:app_teste/Models/OrdemServicos.Model.dart';
import 'package:http/http.dart' as http;

List<OrdemServicos> parseOrdemServico(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<OrdemServicos>((json) => OrdemServicos.fromJson(json)).toList();
}

Future<List<OrdemServicos>> fetchOrdemServico() async {
  final response =
      await http.get('http://192.168.0.115:9000/ordens');

  return parseOrdemServico(response.body);
}