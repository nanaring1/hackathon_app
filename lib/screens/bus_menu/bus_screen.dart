import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String _currentPosition = "위치를 가져오는 중...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // 위치 권한을 요청
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        setState(() {
          _currentPosition = "위치 권한이 거부되었습니다.";
        });
        return;
      }

      // 현재 위치를 가져옴
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = "위도: ${position.latitude}, 경도: ${position.longitude}";
      });
    } catch (e) {
      setState(() {
        _currentPosition = "위치를 가져오는 데 실패했습니다: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Center(
        child: Text(
          _currentPosition,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
