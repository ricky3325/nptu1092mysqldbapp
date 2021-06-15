import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class comUpdPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<comUpdPage> {

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
          title: Text("公司資料維護系統"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: compannyID,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入公司ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameInfo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入公司名稱",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: contentInfo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入公司聯絡方式",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: titleInfo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入公司統一編號",
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
                      onTap: _launchURLupdCom,
                      child: Text("確認編輯公司資料",style: TextStyle(
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
                      onTap: _launchURLaddCom,
                      child: Text("確認新增公司資料",style: TextStyle(
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
                      onTap: _launchURLdelCom,
                      child: Text("確認刪除公司資料",style: TextStyle(
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

  _launchURLupdCom() async {
    final String U1 = contactID.text;
    final String U2 = compannyID.text;
    final String U3 = nameInfo.text;
    final String U4 = contentInfo.text;
    final String U5 = titleInfo.text;
    final String url = "http://192.168.1.117/ai2/upd/company.php?jno=$U2&jname=$U3&taxid=$U5&method=$U4";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLaddCom() async {
    final String U2 = compannyID.text;
    final String U3 = nameInfo.text;
    final String U4 = contentInfo.text;
    final String U5 = titleInfo.text;
    //final String url = "http://192.168.1.105/$myController.text";//myController.text
    final String url = "http://192.168.1.117/ai2/add/company.php?jno=$U2&jname=$U3&taxid=$U5&method=$U4";
    //const url = UrlTo.;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLdelCom() async {
    final String U1 = contactID.text;
    final String U2 = compannyID.text;
    final String U3 = nameInfo.text;
    final String U4 = contentInfo.text;
    final String U5 = titleInfo.text;
    //final String url = "http://192.168.1.105/$myController.text";//myController.text
    final String url = "http://192.168.1.117/ai2/del/company.php?jno=$U2";
    //const url = UrlTo.;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}