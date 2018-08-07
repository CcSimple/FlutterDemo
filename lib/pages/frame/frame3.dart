import 'package:flutter/material.dart';
import 'package:FlutterDemo/pages/frame/pages/index.dart';
import 'package:FlutterDemo/pages/frame/pages/order.dart';
import 'package:FlutterDemo/pages/frame/pages/mine.dart';

class Frame3Page extends StatefulWidget {
  @override
  _Frame3PagePageState createState() => new _Frame3PagePageState();
}

class _Frame3PagePageState extends State<Frame3Page> {
  int tabIndex = 0;
  String title = '首页';
  bool isSelected(int index) {
    return tabIndex == index ? true : false;
  }
  Widget getBodyPage() {
    if (tabIndex == 0) {
      title = '首页';
      return new IndexPage(bar: false);
    } else if (tabIndex == 1) {
      title = '订单';
      return new OrderPage(bar: false);
    } else if (tabIndex == 2) {
      title = '我的';
      return new MinePage(bar: false);
    } else {
      title = '首页';
      return new IndexPage(bar: false);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // 获取 HomePage 的 final title, 并设置到AppBar 上
          title: new Text(title),
        ),
        drawer: new Drawer(
            child: new ListView(
              padding: const EdgeInsets.only(),
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text('CcSimple'),
                  accountEmail: new Text('https://github.com/CcSimple'),
                  currentAccountPicture: new CircleAvatar(
                    backgroundImage: new AssetImage('assets/logo.png'),
                  ),
                  otherAccountsPictures: <Widget>[
                    new CircleAvatar(
                        backgroundImage: new AssetImage('assets/uncleice.png')),
                    new CircleAvatar(
                        backgroundImage: new AssetImage('assets/logo.png'))
                  ],
                ),
                new ListTile(
                    leading: new Icon(Icons.home),
                    title: new Text('首页'),
                    trailing: new Icon(Icons.chevron_right),
                    selected: isSelected(0),
                    onTap: () {
                      Navigator.of(context).pop();
                      if (tabIndex != 0) {
                        setState(() {
                          tabIndex = 0;
                        });
                      }
                    }),
                new Divider(),
                new ListTile(
                    leading: new Icon(Icons.assignment),
                    title: new Text('订单'),
                    trailing: new Icon(Icons.chevron_right),
                    selected: isSelected(1),
                    onTap: () {
                      Navigator.of(context).pop();
                      if (tabIndex != 1) {
                        setState(() {
                          tabIndex = 1;
                        });
                      }
                    }),
                new Divider(),
                new ListTile(
                    leading: new Icon(Icons.account_circle),
                    title: new Text('我的'),
                    trailing: new Icon(Icons.chevron_right),
                    selected: isSelected(2),
                    onTap: () {
                      Navigator.of(context).pop();
                      if (tabIndex != 2) {
                        setState(() {
                          tabIndex = 2;
                        });
                      }
                    }),
                new Divider(),
              ],
            )),
        body: getBodyPage(),
        floatingActionButton: new Builder(builder: (BuildContext context){
          return new FloatingActionButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: 'drawer',
              child: new Icon(Icons.menu)
          );
        })
    );
  }
}
