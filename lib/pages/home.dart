import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  // 应用的主页
  // final 标示 , 在构建方法中使用
  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _frame1() {
    Navigator.pushNamed(context, '/frame1');
  }
  void _frame2() {
    Navigator.pushNamed(context, '/frame2');
  }
  @override
  Widget build(BuildContext context) {
    // 每次调用setState 都会运行
    // Scaffold可视化的脚手架  可快速创建Md 控件 ， Ctrl+点击 可查看可选控件/参数
    return new Scaffold(
      // AppBar 控件
      appBar: new AppBar(
        // 获取 HomePage 的 final title, 并设置到AppBar 上
        title: new Text(widget.title),
      ),
      // Center 布局, 子布局位于该布局中间
      body: new Center(
        // Column布局,  默认包裹内容(子布局大小),
        // 在Flutter inspector 中 开启 Toggle Debug Paint  可以查看布局线框
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Column布局 的子布局 数组
          children: <Widget>[
            new RaisedButton(
                child: new Text(
                  'BottomNavigationBar',
                ),
                // 默认颜色
                color: Colors.blue,
                // 按下时的颜色
                highlightColor: Colors.blueAccent,
                // 不可用时颜色
//                disabledColor: Colors.grey,
                // 正常情况文本颜色
                textColor: Colors.white,
                // 不可用时文本颜色
//              disabledTextColor: Colors.black54,
                onPressed: _frame1
            ),new RaisedButton(
                child: new Text(
                  'Drawer',
                ),
                // 默认颜色
                color: Colors.blue,
                // 按下时的颜色
                highlightColor: Colors.blueAccent,
                // 正常情况文本颜色
                textColor: Colors.white,
                onPressed: _frame2
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

}