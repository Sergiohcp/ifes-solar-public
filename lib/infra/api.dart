import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SolarApi {
  final baseUrl = dotenv.env['BASE_URL'];
  final client = http.Client();

  Future<http.BaseResponse> get(String url,
      [Map<String, String>? headersParam]) async {
    var headers = {
      "Content-Type": "application/json",
    };

    if (headersParam != null) {
      headers = {...headers, ...headersParam};
    }
    return client.get(Uri.parse('${baseUrl}$url'), headers: headers);
  }

  Future<http.BaseResponse> post(String url, Object? body,
      [Map<String, String>? headersParam]) async {
    var headers = {
      "Content-Type": "application/json",
    };

    if (headersParam != null) {
      headers = {...headers, ...headersParam};
    }
    return client.post(Uri.parse('${baseUrl}$url'),
        headers: headers, body: jsonEncode(body));
  }
}

class SolcastApi {
  final baseUrl = dotenv.env['SOLCAST_BASE_URL'];
  final client = http.Client();

  final headers = {'Authorization': 'Bearer ${dotenv.env['SOLCAST_API_KEY']}'};

  Future<http.BaseResponse> get(String url) async {
    return client.get(Uri.parse('${baseUrl}$url'), headers: headers);
  }
}

final api = SolarApi();
final solcastApi = SolcastApi();
