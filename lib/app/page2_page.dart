import 'package:flutter/material.dart';

class Page2Page extends StatefulWidget {
  final String title;
  const Page2Page({Key? key, this.title = 'Page2'}) : super(key: key);
  @override
  Page2PageState createState() => Page2PageState();
}

class Page2PageState extends State<Page2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
