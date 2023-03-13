// ignore_for_file: avoid_print

import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_flutter/common/bootstrap.dart';

import 'pages/web/web.dart';

void main() => bootstrap();

// 启动函数
void bootstrap() async {
  await Bootstrap().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Web(),
    );
  }
}
