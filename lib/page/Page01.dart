import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app0403/page/Page05.dart';

class recordPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<recordPage> {

  final findKeyword = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    findKeyword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("客戶資料維護系統"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: findKeyword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入查詢關鍵字",
                ),
              ),
            ),

            Card(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.open_in_browser, color: Colors.white,),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: _launchURLfindCont,
                      child: Text("查詢聯絡人資料",style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.open_in_browser, color: Colors.white,),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: _launchURLfindCom,
                      child: Text("查詢公司聯絡人資料",style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),
            ),

            Card(
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.navigation_outlined, color: Colors.white,),

                    SizedBox(width: 5,),
                    InkWell(
                      onTap:  _launchMap,
                      child: Text("聯絡人資料維護系統",style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),

            ),

          ],
        )

    );
  }

  _launchMap() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => contUpdPage()),
    );
  }

  _launchURLfindCont() async {
    final String Name = findKeyword.text;
    final String url = "http://192.168.1.117/ai2/find/contact.php?keyword=$Name";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLfindCom() async {
    final String Name = findKeyword.text;
    //final String url = "http://192.168.1.105/$myController.text";//myController.text
    final String url = "http://192.168.1.117/ai2/find/contact.php?jname=$Name";
    //const url = UrlTo.;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}