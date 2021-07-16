import 'package:flutter/material.dart';

class Page3Page extends StatefulWidget {
  final String title;
  const Page3Page({Key? key, this.title = 'Page3'}) : super(key: key);
  @override
  Page3PageState createState() => Page3PageState();
}

class Page3PageState extends State<Page3Page> {
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
