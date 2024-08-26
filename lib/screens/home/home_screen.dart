import 'package:flutter/material.dart';
import 'package:hackathon_app/screens/bus_menu/bus_screen.dart';
import 'package:hackathon_app/screens/taxi_menu/taxi_screen.dart';
import 'package:hackathon_app/screens/call_menu/call_screen.dart';
import 'package:hackathon_app/screens/emergen_menu/emergen_screen.dart';
import 'package:hackathon_app/services/location_service.dart';
import 'package:hackathon_app/services/api_service.dart';
import 'package:hackathon_app/services/unique_id_service.dart';  // 고유 ID 서비스를 import
import 'package:url_launcher/url_launcher.dart';  // url_launcher 패키지 import

class HomeScreen extends StatelessWidget {
  final LocationService _locationService = LocationService();
  final ApiService _apiService = ApiService();
  final UniqueIdService _uniqueIdService = UniqueIdService();  // 고유 ID 서비스 인스턴스 생성

  @override
  Widget build(BuildContext context) {
    String uniqueId = _uniqueIdService.getUniqueId();  // 고유 ID 가져오기

    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 배너 제거
      home: Scaffold(
        // AppBar 제거
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '고유 ID: $uniqueId',  // 고유 ID를 화면에 표시
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                    onPressed: () async {
                      // GPS 데이터를 가져와 서버에 전송
                      try {
                        final position = await _locationService.getCurrentLocation();
                        await _apiService.sendLocationData(position.latitude, position.longitude);
                        print('Location sent: (${position.latitude}, ${position.longitude})');
                      } catch (e) {
                        print('Failed to send location: $e');
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Screen1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글기를 8.0으로 설정
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft, // 왼쪽 상단에 정렬
                      child: Text(
                        '버스정보',
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                    onPressed: () async {
                      try {
                        // API를 호출하여 택시 번호 가져오기
                        String taxiNumber = await _apiService.getTaxiNumber();

                        // 택시 번호로 전화 걸기
                        String telUrl = 'tel:$taxiNumber';
                        if (await canLaunch(telUrl)) {
                          await launch(telUrl);
                        } else {
                          throw 'Could not launch $telUrl';
                        }
                      } catch (e) {
                        print('Failed to make a call: $e');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // 모서리 둥글기를 8.0으로 설정
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft, // 왼쪽 상단에 정렬
                      child: Text(
                        '택시호출',
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen3()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // 모서리 둥글기를 8.0으로 설정
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topLeft, // 왼쪽 상단에 정렬
                    child: Text(
                      '간편연락',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen4()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),)
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '긴급호출',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
