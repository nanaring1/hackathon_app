import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Screen4 extends StatelessWidget { // class EmergenScreen 으로 바꿔야 할지 고민
  // 전화 걸기 기능을 구현하는 메서드
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('긴급호출'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start, // 위쪽 정렬
        children: [
                // 112 버튼
                Container(
                  width: double.infinity,
                  height: 130.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () => _makePhoneCall('112'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '112 신고',
                          style: TextStyle(fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(Icons.phone, size: 50,color: Colors.white,),
                      ],
                    ),
                  ),
                ),
                // 119 버튼
                Container(
                  width: double.infinity,
                  height: 130.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () => _makePhoneCall('119'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '119 신고',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        Icon(Icons.phone, size: 50,color: Colors.white,),
                      ],
                    ),
                  ),
                ),
                // 미정 버튼 1
                Container(
                  width: double.infinity,
                  height: 130.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () => _makePhoneCall('미정'), // 여기에 실제 전화번호를 설정하세요
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '미정 1',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        Icon(Icons.phone, size: 50,color: Colors.white,),
                      ],
                    ),
                  ),
                ),
                // 미정 버튼 2
                Container(
                  width: double.infinity,
                  height: 130.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () => _makePhoneCall('미정'), // 여기에 실제 전화번호를 설정하세요
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '미정 2',
                          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        Icon(Icons.phone, size: 50,color: Colors.white,),
                      ],
                    ),
                  ),
                ),
                // "이전 화면" 버튼
                /* Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                            (route) => route.isFirst,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.green, // 버튼의 배경색
                      foregroundColor: Colors.white, // 버튼의 텍스트 색상
                    ),
                    child: Text('이전 화면'),
                  ),
                ),
                */
              ],
            ),
          );
  }
}
