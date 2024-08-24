import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 4'),
      ),
      body: Stack(
        children: [
          Center(
            child: Text('This is Screen 4'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                        (route) => route.isFirst,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // 버튼의 배경색
                  foregroundColor: Colors.white, // 버튼의 텍스트 색상
                ),
                child: Text('이전 화면'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

