import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String _baseUrl = ''; // 서버 URL

  // 위치 데이터를 서버에 전송
  Future<void> sendLocationData(double latitude, double longitude) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/location'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, double>{
        'latitude': latitude,
        'longitude': longitude,
      }),
    );

    if (response.statusCode != 200) {
      // 서버 응답이 성공적이지 않으면 예외 처리
      throw Exception('Failed to send location data');
    }
  }
}
