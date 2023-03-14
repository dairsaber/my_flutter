import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

import 'dart:io' show Platform;

class Web extends StatefulWidget {
  const Web({Key? key}) : super(key: key);

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  Future<bool> onWillPop() async {
    // 调用javascript 中的路由pop
    var isOk = await _controller
        .runJavascriptReturningResult('___Flutter.routerPop()');

    debugPrint("系统级别的后退$isOk");
    return isOk as bool;
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("..."),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
              child: WebView(
            initialUrl: 'http://192.168.110.111:5173/#/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
            onProgress: (int progress) {
              print('WebView is loading (progress : $progress%)');
            },
            javascriptChannels: <JavascriptChannel>{
              _toasterJavascriptChannel(context),
            },
            // navigationDelegate: (NavigationRequest request) {
            //   if (request.url.startsWith('https://www.youtube.com/')) {
            //     print('blocking navigation to $request}');
            //     return NavigationDecision.prevent;
            //   }
            //   print('allowing navigation to $request');
            //   return NavigationDecision.navigate;
            // },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
            backgroundColor: Colors.white,
            geolocationEnabled: true,
          )),
        ));
  }
}
