import 'package:flixxiewatch/pages/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
      },
      clipBehavior: Clip.hardEdge,
      maximumSize: Size(360, 800),
      enabled: kIsWeb,
      backgroundColor: Colors.grey,
    );
  }
}
