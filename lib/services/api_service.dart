import 'package:http/http.dart' as http;
import 'dart:convert';
import 'unique_id_service.dart'; // 고유 번호 서비스를 가져옵니다

class ApiService {
  final String _baseUrl = 'https://example.com'; // 서버 URL
  final UniqueIdService _uniqueIdService = UniqueIdService(); // 고유 번호 서비스 인스턴스

  // 위치 데이터를 서버에 전송
  Future<void> sendLocationData(double latitude, double longitude) async {
    final url = Uri.parse('$_baseUrl/user/location/${latitude},${longitude}');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to send location data');
    }
  }

  // 고유 번호를 서버에 전송
  Future<void> sendUniqueIdToServer() async {
    String uniqueId = _uniqueIdService.getUniqueId();

    final response = await http.post(
      Uri.parse('$_baseUrl/unique_id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'unique_id': uniqueId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to send unique ID');
    }
  }

  // 택시 번호를 서버에서 가져오기
  Future<String> getTaxiNumber() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/call/texi'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['taxi_number'];
      } else {
        throw Exception('Failed to load taxi number');
      }
    } catch (e) {
      print('Error fetching taxi number: $e');
      rethrow;
    }
  }

  // 장소 데이터 가져오기
  Future<List<String>> getDestinationPlaces() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/destinations'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<String>.from(data['places']);
      } else {
        throw Exception('Failed to load destinations');
      }
    } catch (e) {
      print('Error fetching destinations: $e');
      rethrow;
    }
  }

  // 버스 도착 정보를 서버에서 가져오기
  Future<Map<String, String>> getBusArrivalInfo(String destination) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/bus_arrival/$destination'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'bus_number': data['bus_number'],
          'minutes_remaining': data['minutes_remaining'],
        };
      } else {
        throw Exception('Failed to load bus arrival info');
      }
    } catch (e) {
      print('Error fetching bus arrival info: $e');
      rethrow;
    }
  }

  // 연락처 데이터를 서버에서 가져오기
  Future<List<Map<String, String>>> getContacts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/contacts'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return List<Map<String, String>>.from(data['contacts'].map((contact) => {
          'name': contact['name'],
          'phone': contact['phone'],
        }));
      } else {
        throw Exception('Failed to load contacts');
      }
    } catch (e) {
      print('Error fetching contacts: $e');
      rethrow;
    }
  }
}
