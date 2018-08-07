import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key, this.bar}) : super(key: key);
  // 是否显示 appBar
  final bool bar;
  @override
  _IndexPageState createState() => new _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: widget.bar?new AppBar(
        title: new Text('首页'),
          // 这个参数默认 true, ==> 当有Drawer的时候, 现在Menu 没有的时候显示back
          automaticallyImplyLeading: false
      ):null,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              new Text('首页')
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

}