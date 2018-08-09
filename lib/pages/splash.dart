import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // 3秒后进入主页面
    countDown();
  }
  // 倒计时
  countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration,goHome);
  }
  goHome() {
    // 不使用全局路由名称的跳转
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return new Image.asset("assets/splash.png");
  }
}
