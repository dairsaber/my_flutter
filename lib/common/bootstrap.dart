import 'package:flutter/material.dart';

class Bootstrap {
  /// 初始化
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));
    debugPrint("初始化完成");
  }
}
