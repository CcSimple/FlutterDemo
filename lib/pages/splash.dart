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
//    countDown();
    startTimer();
  }
  // 倒计时
  countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration,goHome);
  }
  // 倒计时加入事件
  Timer _timer;
  int _seconds=3;
  startTimer() {
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      if (_seconds == 1) {
        _cancelTimer();
        goHome();
        return;
      }
      setState(() {
        _seconds--;
      });
    });
  }
  _cancelTimer() {
    _timer?.cancel();
  }

  goHome() {
    // 不使用全局路由名称的跳转,关闭当前页面
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => new HomePage(title: 'Flutter 学习记录')));
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Image.asset("assets/splash.png"),
        new Column(
            mainAxisAlignment:MainAxisAlignment.end,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new FlatButton(
                  child: new Text(
                      '$_seconds(s)',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                  onPressed: (){},
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
