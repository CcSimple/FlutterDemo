import 'package:flutter/material.dart';
import 'package:FlutterDemo/pages/frame/pages/index.dart';
import 'package:FlutterDemo/pages/frame/pages/order.dart';
import 'package:FlutterDemo/pages/frame/pages/mine.dart';

class Frame3Page extends StatefulWidget {
  @override
  _Frame3PagePageState createState() => new _Frame3PagePageState();
}
class _Frame3PagePageState extends State<Frame3Page> {
  // 定义Tba
  List<Widget> tabs =  <Widget>[
    new Tab(text: '首页', icon: new Icon(Icons.home)),
    new Tab(text: '订单', icon: new Icon(Icons.assignment)),
    new Tab(text: '我的', icon: new Icon(Icons.account_circle)),
    new Tab(text: '首页', icon: new Icon(Icons.home)),
    new Tab(text: '订单', icon: new Icon(Icons.assignment)),
    new Tab(text: '我的', icon: new Icon(Icons.account_circle)),
    new Tab(text: '首页', icon: new Icon(Icons.home)),
    new Tab(text: '订单', icon: new Icon(Icons.assignment)),
    new Tab(text: '我的', icon: new Icon(Icons.account_circle)),
  ];
  List<Widget> pages = <Widget>[
     new IndexPage(bar: false),
     new OrderPage(bar: false),
     new MinePage(bar: false),
     new IndexPage(bar: false),
     new OrderPage(bar: false),
     new MinePage(bar: false),
     new IndexPage(bar: false),
     new OrderPage(bar: false),
     new MinePage(bar: false),
  ];
  @override
  void initState() {
    super.initState();
  }

//  TabBarView
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabs.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('TabBarView'),
            bottom: new TabBar(
              isScrollable: true,
              tabs: tabs.map((Widget tab) {
                return tab;
              }).toList(),
            ),
          ),
          body: new TabBarView(
              children: pages.map((Widget page) {
                return page;
              }).toList(),
          ),
        )
    );
  }
}
