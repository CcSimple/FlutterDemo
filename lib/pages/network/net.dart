import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NetPage extends StatefulWidget {
  @override
  _NetPageState createState() => new _NetPageState();
}

class _NetPageState extends State<NetPage> {
  var _result = '结果: ';
  bool loading = false;

  // Dio 网络请求库 实例
  Dio dio = new Dio(new Options(
      baseUrl: "http://www.wanandroid.com/",
      connectTimeout: 5000,
      receiveTimeout: 3000));

  _loadHotKey() async {
    try {
      setState(() {
        loading = true;
      });
      print('------------ start ------------------');
      Response response = await dio.get("hotkey/json");
      print('------------------------------');
      print(response.toString());
      print(response.data.toString());
      print('------------------------------');
      setState(() {
        loading = false;
        _result = '结果: ' + response.data['data'].toString();
      });
    } catch (e) {
      print(e);
      setState(() {
        loading = false;
        _result = '结果-catch: ' + e.toString();
      });
    }
  }

  _loadTest(title) {
    _result = title;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // 获取 HomePage 的 final title, 并设置到AppBar 上
          title: new Text('Dio网络库 & JSON & async'),
        ),
        body: new Stack(
          // 子布局约束 loose: 可扩充的; expand: 最大化; passthrough: 水平包裹,垂直可扩充
          fit: StackFit.expand,
          // 超出部分是否可见
//          overflow: Overflow.visible,
          children: <Widget>[
            new Column(children: <Widget>[
              // 换行的布局
              new Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: new Wrap(
                  spacing: 8.0, // 左右间距
                  runSpacing: 4.0, // 上下间距
                  children: <Widget>[
                    new RaisedButton(
                        child: new Text(
                          '默认请求1',
                        ),
                        color: Colors.blue,
                        highlightColor: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: _loadHotKey),
                    new RaisedButton(
                        child: new Text(
                          '默认请求2',
                        ),
                        color: Colors.blue,
                        highlightColor: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          _loadTest('默认请求2');
                        }),
                    new RaisedButton(
                        child: new Text(
                          '默认请求3',
                        ),
                        color: Colors.blue,
                        highlightColor: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          _loadTest('默认请求3');
                        }),
                    new RaisedButton(
                        child: new Text(
                          '默认请求4',
                        ),
                        color: Colors.blue,
                        highlightColor: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          _loadTest('默认请求4');
                        }),
                    new RaisedButton(
                        child: new Text(
                          '默认请求5',
                        ),
                        color: Colors.blue,
                        highlightColor: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          _loadTest('默认请求5');
                        }),
                    new RaisedButton(
                        child: new Text(
                          '默认请求6',
                        ),
                        color: Colors.blue,
                        highlightColor: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          _loadTest('默认请求6');
                        }),
                  ],
                ),
              ),
              new Padding(
                  padding:
                      const EdgeInsets.only(left: 14.0, right: 14.0, top: 20.0),
                  child: new Text(_result))
            ]),
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
                          new Text('加载中...',style: new TextStyle(
                              color: Colors.white,
                          ),)
                        ],
                      ),
                    ),
                  )
                : new Container()
          ],
        ));
  }
}
