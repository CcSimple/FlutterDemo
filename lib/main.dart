import 'package:flutter/material.dart';
import 'package:FlutterDemo/pages/home.dart';
import 'package:FlutterDemo/pages/frame/frame1.dart';
import 'package:FlutterDemo/pages/frame/frame2.dart';
import 'package:FlutterDemo/pages/frame/frame3.dart';
import 'package:FlutterDemo/pages/network//net.dart';
import 'package:FlutterDemo/pages/frame/pages/index.dart';
import 'package:FlutterDemo/pages/frame/pages/order.dart';
import 'package:FlutterDemo/pages/frame/pages/mine.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // 应用的根
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // 应用的主题
        primarySwatch: Colors.blue,
      ),
      // 全局 路由名称及对应页面
      routes: <String, WidgetBuilder> {
        '/frame1': (BuildContext context) => new Frame1Page(),
        '/frame2': (BuildContext context) => new Frame2Page(),
        '/frame3': (BuildContext context) => new Frame3Page(),
        '/net': (BuildContext context) => new NetPage(),
        '/index': (BuildContext context) => new IndexPage(),
        '/order': (BuildContext context) => new OrderPage(),
        '/mine': (BuildContext context) => new MinePage(),
      },
      home: new HomePage(title: 'Flutter 学习记录')
    );
  }
}
