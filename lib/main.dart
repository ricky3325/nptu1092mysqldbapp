import 'package:flutter/material.dart';
import 'package:flutter_app0403/page/Page01.dart';
import 'package:flutter_app0403/page/Page02.dart';
import 'package:flutter_app0403/page/Page03.dart';
import 'package:flutter_app0403/page/Page06.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(

          drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('國立屏東大學\n資料庫系統期末專題'),
                    decoration: BoxDecoration(
                    color: Colors.blue,
                    ),
                  ),
                  /*ListTile(
                     title: Text('Item 1'),
                    onTap: () {
                      // Update the state of the app.
                    // ...
                    },
                  ),
                  ListTile(
                    title: Text('Item 2'),
                    onTap: () {
                    // Update the state of the app.
                     // ...
                    },
                 ),*/
                ],
            ),
          ),

        appBar: AppBar(
          title: Text("凌揚科技系統公司 工程系統"),
          //leading: Icon(FontAwesomeIcons.dragon),
          actions: <Widget>[
            /*IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: null,
            )*/
          ],
          bottom: TabBar(
            tabs: tabList.map((choice) {
              return Tab(
                text: choice.title,       //Tab's title
                icon: Icon(choice.icon),  //Tab's icon
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
        children: [
            recordPage(),//Center(child: Text("0", style: TextStyle(fontSize: 40),)),
            pricePage(),//Center(child: Text("1", style: TextStyle(fontSize: 40),)),
            ScanPage(),
            findPage(),//Center(child: Text("2", style: TextStyle(fontSize: 40),)),
          ],

              /*children:tabList.map((choice) {
              return Center(
                child: Icon(
                  choice.icon,
                  size: 100.0,
                ),
              );
            }).toList()*/),
      ),
    );
  }
}

class TabChoice {
  final String title;
  final IconData icon;
  const TabChoice(this.title, this.icon);
}

const List<TabChoice> tabList = const <TabChoice>[
  TabChoice('客戶資料', Icons.assignment_ind_outlined),
  TabChoice('報價系統', Icons.shopping_cart_outlined),
  TabChoice("設備檢修", Icons.build_outlined),
  TabChoice("系統資訊", Icons.info_outline),
];