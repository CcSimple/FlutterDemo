import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
      home: new MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // 应用的主页
  // final 标示 , 在构建方法中使用
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 应用 可管理的 参数/方法
  int _counter = 0;
  int index = 2;

  void _incrementCounter() {
    // 调用setState 更新页面值 不调用将不会发生变化
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 导入的包 包含数千个最常用的英文单词以及一些实用功能
    final wordPair = new WordPair.random();
    //
    final List<BottomNavigationBarItem> items =<BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text("首页"),
        backgroundColor: Colors.blue
      ),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.assignment),
          title: new Text("待收"),
        backgroundColor: Colors.blue
      ),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.assignment_late),
          title: new Text("配送"),
        backgroundColor: Colors.blue
      ),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.assignment_turned_in),
          title: new Text("完成"),
        backgroundColor: Colors.blue
      ),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.account_circle),
          title: new Text("我的"),
        backgroundColor: Colors.blue
      ),
    ];
    // 每次调用setState 都会运行
    // Scaffold可视化的脚手架  可快速创建Md 控件 ， Ctrl+点击 可查看可选控件/参数
    return new Scaffold(
      // AppBar 控件
      appBar: new AppBar(
        // 获取 MyHomePage 的 final title, 并设置到AppBar 上
        title: new Text(widget.title),
      ),
      // Center 布局, 子布局位于该布局中间
      body: new Center(
        // Column布局,  默认包裹内容(子布局大小),
        // 在Flutter inspector 中 开启 Toggle Debug Paint  可以查看布局线框
        child: new Column(
          // 大小
          mainAxisSize: MainAxisSize.max,
          // 居中对齐
          mainAxisAlignment: MainAxisAlignment.center,
          // 排列方式 up/down  上到下, 下到上
          verticalDirection: VerticalDirection.up,
          // 文本对齐方式
          textDirection: TextDirection.ltr,
          // Column布局 的子布局 数组
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
                wordPair.asPascalCase + '$index'
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      // bottomNavigationBar
      bottomNavigationBar: new BottomNavigationBar(
          items: items,
          onTap: onTap,
          currentIndex: index,
          // 不设置 默认 长度 <= 3 是 fixed 否则 shifting
          type: BottomNavigationBarType.shifting,
          // 当BottomNavigationBarType 为 fixed 时候 选中项的颜色
          fixedColor: Colors.blue
      ),
      // floatingActionButton 控件
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  void onTap(int index){
    print(index);
    setState(() {
      this.index = index;
    });
  }
}
