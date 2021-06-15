import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app0403/page/Page07.dart';

const _url = 'https://flutter.dev';

class ScanPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScanPage> {

  final findKeyword = TextEditingController();
  final equipmentInfo = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    findKeyword.dispose();
    equipmentInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("估價查詢系統"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  controller: equipmentInfo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "編輯請輸入關鍵字查詢設備資訊",
                  )
              )
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
                      onTap: _launchURLfindEqui,
                      child: Text("設備資訊查詢",style: TextStyle(
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
                      onTap: _launchMap,
                      child: Text("設備編輯系統",style: TextStyle(
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
      MaterialPageRoute(builder: (context) => EquiEditPage()),
    );
  }

  _launchURLfindEqui() async {
    final String equipmentName = equipmentInfo.text;
    final String url = "http://192.168.1.117/ai2/find/equipment.php?keyword=$equipmentName";
    //const url = UrlTo.;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}