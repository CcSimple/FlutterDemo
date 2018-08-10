import 'dart:io';
import 'dart:math';
import 'package:FlutterDemo/pages/network/model/HotKey.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'pages/fullload.dart';

class NetPage extends StatefulWidget {
  @override
  _NetPageState createState() => new _NetPageState();
}

class _NetPageState extends State<NetPage> {
  var _type = '';
  var _result = '';
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
      print('------------ _loadHotKey start ------------------');
      Response response = await dio.get("hotkey/json");
      if (response.statusCode == HttpStatus.OK) {
        print('------------------------------');
        print(response.toString());
        print('------------------------------');
        loading = false;
        _type = '请求1-结果 ';
        _result = response.data['data'].toString();
      } else {
        loading = false;
        _type = '请求1-失败 ';
        _result = response.toString();
      }
      print('------------ _loadHotKey end ------------------');
    } catch (e) {
      print(e);
      loading = false;
      _type = '请求1-catch ';
      _result = e.toString();
    }
    _list = <HotKey>[];
    setState(() {});
  }

  List<HotKey> _list = <HotKey>[];

  _loadHotKeyAndJson() async {
    try {
      setState(() {
        loading = true;
      });
      print('------------ _loadHotKeyAndJson start ------------------');
      Response response = await dio.get("hotkey/json");
      if (response.statusCode == HttpStatus.OK) {
        print('------------------------------');
        print(response.toString());
        print('------------------------------');
        List hotkeys = response.data['data'];
        List<HotKey> list = hotkeys.map((model) {
          return new HotKey.fromJson(model);
        }).toList();
        print(list.length);
        print(list[0].toJson());
        loading = false;
        _type = 'json解析 ';
        _result = hotkeys.toString();
        _list = list;
      } else {
        loading = false;
      }
      print('------------ _loadHotKeyAndJson end ------------------');
    } catch (e) {
      print(e);
      loading = false;
      _type = 'json解析-catch';
      _result = e.toString();
    }
    setState(() {});
  }

  Color getColor() {
    int index = new Random().nextInt(5);
    switch (index) {
      case 0:
        return Colors.red;
        break;
      case 1:
        return Colors.pink;
        break;
      case 2:
        return Colors.purple;
        break;
      case 4:
        return Colors.green;
        break;
      default:
        return Colors.blue;
        break;
    }
  }

  _loadTest(title) {
    _type = title;
    _result = '';
    _list = <HotKey>[];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
        // 子布局约束 loose: 可扩充的; expand: 最大化; passthrough: 水平包裹,垂直可扩充
//        fit: StackFit.expand,
        children: <Widget>[
          new Scaffold(
            appBar: new AppBar(
              // 获取 HomePage 的 final title, 并设置到AppBar 上
              title: new Text('Dio网络库 & JSON & async'),
            ),
            body: new Column(
                children: <Widget>[
              // 换行的布局
              new Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14.0,top: 10.0),
                child: new Wrap(
                  spacing: 8.0, // 左右间距
                  runSpacing: 4.0, // 上下间距
                  children: <Widget>[
                    new RaisedButton(
                        child: new Text(
                          '默认请求1',
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: _loadHotKey),
                    new RaisedButton(
                        child: new Text(
                          '请求&json解析',
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          _loadTest('json解析');
                          _loadHotKeyAndJson();
                        }),
                    new RaisedButton(
                        child: new Text(
                          '全屏加载框',
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          // 不使用全局路由名称的跳转
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new FullLoadPage()));
                        }),
                    new RaisedButton(
                        child: new Text(
                          'Toast',
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          _loadTest('Toast');
                          Fluttertoast.showToast(
                              msg: "Toast 测试",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              bgcolor: "#1296db",
                              textcolor: '#ffffff');
                        }),
                  ],
                ),
              ),
              // 请求的文本信息
              new Padding(
                  padding:
                      const EdgeInsets.only(left: 14.0, right: 14.0, top: 20.0),
                  child: new Text.rich(new TextSpan(
                      text: '$_type:',
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      children: [
                        new TextSpan(
                            text: '$_result',
                            style: new TextStyle(
                                fontSize: 16.0, color: Colors.blue))
                      ]))),
              // 解析的数据 Wrap 展示
              new Padding(
                padding:
                    const EdgeInsets.only(left: 14.0, right: 14.0, top: 20.0),
                child: new Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: _list.map((HotKey hotkey) {
                      return new RaisedButton(
                          color: getColor(),
                          textColor: Colors.white,
                          onPressed: () {},
                          child: new Text(
                            hotkey.name,
                            style: new TextStyle(color: Colors.white),
                          ));
                    }).toList()),
              ),
            ]),
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
                      ],
                    ),
                  ),
                )
              : new Container()
        ]);
  }
}
