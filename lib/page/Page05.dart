import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app0403/page/Page08.dart';

class contUpdPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<contUpdPage> {

  final contactID = TextEditingController();
  final compannyID = TextEditingController();
  final nameInfo = TextEditingController();
  final contentInfo = TextEditingController();
  final titleInfo = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    contactID.dispose();
    compannyID.dispose();
    nameInfo.dispose();
    contentInfo.dispose();
    titleInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("聯絡人資料維護系統"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: contactID,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入聯絡人ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: compannyID,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入公司ID(新增資料略過此欄位)",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameInfo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入聯絡人姓名",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: contentInfo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入聯絡方式",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: titleInfo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入聯絡人稱謂",
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
                      onTap: _launchURLupdCont,
                      child: Text("確認編輯聯絡人資料",style: TextStyle(
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
                      onTap: _launchURLaddCont,
                      child: Text("確認新增聯絡人資料",style: TextStyle(
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
                      onTap:  _launchMap2,
                      child: Text("公司資料維護系統",style: TextStyle(
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
                      onTap: _launchURLdelCont,
                      child: Text("確認刪除聯絡人資料",style: TextStyle(
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
  _launchMap2() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => comUpdPage()),
    );
  }
  _launchURLupdCont() async {
    final String U1 = contactID.text;
    final String U2 = compannyID.text;
    final String U3 = nameInfo.text;
    final String U4 = contentInfo.text;
    final String U5 = titleInfo.text;
    final String url = "http://192.168.1.117/ai2/upd/contact.php?nno=$U1&jno=$U2&nname=$U3&method=$U4&title=$U5";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLaddCont() async {
    final String U1 = contactID.text;
    final String U2 = compannyID.text;
    final String U3 = nameInfo.text;
    final String U4 = contentInfo.text;
    final String U5 = titleInfo.text;
    //final String url = "http://192.168.1.105/$myController.text";//myController.text
    final String url = "http://192.168.1.117/ai2/add/contact.php?nno=$U1&jno=$U2&nname=$U3&method=$U4&title=$U5";
    //const url = UrlTo.;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLdelCont() async {
    final String U1 = contactID.text;
    final String U2 = compannyID.text;
    final String U3 = nameInfo.text;
    final String U4 = contentInfo.text;
    final String U5 = titleInfo.text;
    //final String url = "http://192.168.1.105/$myController.text";//myController.text
    final String url = "http://192.168.1.117/ai2/del/contact.php?nno=$U1";
    //const url = UrlTo.;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}