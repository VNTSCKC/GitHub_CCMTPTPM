
/* Họ Tên: Võ Nguyễn Thanh Sang 
  MSSV : 0306201573
  Lớp CĐ TH 20PMD
 */

import 'package:flutter/material.dart';

void main() => runApp(BaiKTApp());

class BaiKTApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        title: Text("AI béc"),
      ),
      body: BaiKTAppHome(),
      ),
    );
  }
}

class BaiKTAppHome extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return BaiKTAppState();
  }

}

class BaiKTAppState extends State<BaiKTAppHome>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(

    );
  }

}
