import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key, this.bar}) : super(key: key);
  // 是否显示 appBar
  final bool bar;
  @override
  _MinePageState createState() => new _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: widget.bar?new AppBar(
        title: new Text('我的'),
      ):null,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('我的')
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

}