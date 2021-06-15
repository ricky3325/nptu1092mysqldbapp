import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


const _url = 'https://flutter.dev';

class EquiEditPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<EquiEditPage> {

  final equipmentID = TextEditingController();
  final contentInfo = TextEditingController();
  final commodityID = TextEditingController();
  final quantityInfo = TextEditingController();
  final dateYear = TextEditingController();
  final dateMonth = TextEditingController();
  final dateDay = TextEditingController();
  final Maint = TextEditingController();
  final statusInfo = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    equipmentID.dispose();
    contentInfo.dispose();
    commodityID.dispose();
    quantityInfo.dispose();
    dateYear.dispose();
    dateMonth.dispose();
    dateDay.dispose();
    Maint.dispose();
    statusInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("設備編輯系統"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: Maint,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入維護ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: equipmentID,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入設備ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: contentInfo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入變更內容",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: dateYear,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入變更年YYYY",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: dateMonth,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入變更月MM",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: dateDay,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入變更日DD",
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
                      onTap: _launchURLaddEqui,
                      child: Text("確認新增一筆設備資訊",style: TextStyle(
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
                      onTap: _launchURLupdEqui,
                      child: Text("確認編輯設備資訊",style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.red, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.open_in_browser, color: Colors.white,),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: _launchURLdelEqui,
                      child: Text("確認刪除設備資訊",style: TextStyle(
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

  _launchURLaddEqui() async {
    final String U1 = equipmentID.text;
    final String U2 = contentInfo.text;
    final String U3 = dateYear.text;
    final String U4 = dateMonth.text;
    final String U5 = dateDay.text;
    final String U6 = Maint.text;
    final String url = "http://192.168.1.117/ai2/add/equipment.php?edate=$U3-$U4-$U5&summarize=$U2&maint=$U6&eID=$U1";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLupdEqui() async {
    final String U1 = equipmentID.text;
    final String U2 = contentInfo.text;
    final String U3 = dateYear.text;
    final String U4 = dateMonth.text;
    final String U5 = dateDay.text;
    final String U6 = Maint.text;
    final String url = "http://192.168.1.117/ai2/upd/equipment.php?edate=$U3-$U4-$U5&summarize=$U2&maint=$U6&eID=$U1";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLdelEqui() async {
    final String U1 = equipmentID.text;
    final String U2 = contentInfo.text;
    final String U3 = dateYear.text;
    final String U4 = dateMonth.text;
    final String U5 = dateDay.text;
    final String U6 = Maint.text;
    final String url = "http://192.168.1.117/ai2/del/equipment.php?eID=$U6";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}