import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FullLoadPage extends StatefulWidget {
  @override
  _FullLoadPageState createState() => new _FullLoadPageState();
}

class _FullLoadPageState extends State<FullLoadPage> {
  bool loading = false;

  loadStart() {
    setState(() {
      loading = true;
    });
    countDown();
  }
  // 倒计时
  countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration,loadEnd);
  }
  loadEnd() {
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Scaffold(
          appBar: new AppBar(
            title: new Text('全屏加载框'),
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                    child: new Text(
                      '加载',
                    ),
                    color: Colors.blue,
                    highlightColor: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      loadStart();
                    }),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
        loading
            ? new Container(
          color: Colors.black54,
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: new SpinKitThreeBounce(
                      color: Colors.white,
                      size: 30.0,
                    )),
                // 套一层 修改样式问题.....
                new FlatButton(
                    onPressed: (){},
                    child: new Text('加载中...',
                      style: new TextStyle(color: Colors.white),)
                )
                // 因为没有在  Scaffold 中, 字体样式 不一样
//                new Text('加载中...',
//                  style: new TextStyle(
//                    color: Colors.white,
//                    fontStyle: FontStyle.normal,
//                    fontSize:  14.0,
//                ),)
              ],
            ),
          ),
        ) : new Container()
      ],
    );
  }
}
