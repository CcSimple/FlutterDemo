import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key, this.bar}) : super(key: key);
  // 是否显示 appBar
  final bool bar;
  @override
  _OrderPageState createState() => new _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: widget.bar?new AppBar(
        title: new Text('订单'),
      ):null,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('订单')
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

}