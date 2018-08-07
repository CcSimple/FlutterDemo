import 'package:flutter/material.dart';
import 'package:FlutterDemo/pages/frame/pages/index.dart';
import 'package:FlutterDemo/pages/frame/pages/order.dart';
import 'package:FlutterDemo/pages/frame/pages/mine.dart';

class Frame1Page extends StatefulWidget {
  @override
  _Frame1PagePageState createState() => new _Frame1PagePageState();
}

class _Frame1PagePageState extends State<Frame1Page> {
  // 当前选中项
  int pageIndex = 0;
  PageController pageController;
  // BottomNavigationBar 中的按钮组
  final List<BottomNavigationBarItem> items =<BottomNavigationBarItem>[
    new BottomNavigationBarItem(
        icon: new Icon(Icons.home),
        title: new Text("首页"),
        backgroundColor: Colors.blue
    ),
    new BottomNavigationBarItem(
        icon: new Icon(Icons.assignment),
        title: new Text("订单"),
        backgroundColor: Colors.blue
    ),
    new BottomNavigationBarItem(
        icon: new Icon(Icons.account_circle),
        title: new Text("我的"),
        backgroundColor: Colors.blue
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // PageView 布局, 可滑动的页面
      body: new PageView(
          children:[
            new IndexPage(bar: true),
            new OrderPage(bar: true),
            new MinePage(bar: true),
          ],
          // 滑动控制器
          controller: pageController,
          // 页面改变回调
          onPageChanged: onPageChanged
      ),
      backgroundColor: Colors.white,
      // bottomNavigationBar
      bottomNavigationBar: new BottomNavigationBar(
          items: items,
          onTap: onTap,
          currentIndex: pageIndex,
          // 不设置 默认 长度 <= 3 是 fixed 否则 shifting
          type: BottomNavigationBarType.shifting,
          // 当BottomNavigationBarType 为 fixed 时候 选中项的颜色
          fixedColor: Colors.blue
      ),
    );
  }

  // 点击 BottomNavigationBar 事件
  void onTap(int index) {
    // 通过pageController 带动画的切换page
    pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }
  // PageView pages改变的时候回调事件
  onPageChanged(int index) {
    setState(() {
      this.pageIndex = index;
    });
  }
}