import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app0403/page/Page09.dart';

const _url = 'https://flutter.dev';

class priceAddPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<priceAddPage> {

  final quoteID = TextEditingController();
  final contactID = TextEditingController();
  final commodityID = TextEditingController();
  final quantityInfo = TextEditingController();
  final dateYear = TextEditingController();
  final dateMonth = TextEditingController();
  final dateDay = TextEditingController();
  final statusInfo = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    quoteID.dispose();
    contactID.dispose();
    commodityID.dispose();
    quantityInfo.dispose();
    dateYear.dispose();
    dateMonth.dispose();
    dateDay.dispose();
    statusInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("估價產生系統"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: quoteID,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入報價ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: contactID,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入聯絡人ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: commodityID,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入品名ID",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: quantityInfo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入需求數量",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: dateYear,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入報價年YYYY",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: dateMonth,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入報價月MM",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: dateDay,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入報價日DD",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: statusInfo,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "請輸入報價狀態",
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
                      child: Text("確認新增一筆估價資料",style: TextStyle(
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
                      onTap: _launchURLupdCont,
                      child: Text("確認編輯估價狀態",style: TextStyle(
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
                      child: Text("商品資訊維護系統",style: TextStyle(
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
                      onTap: _launchURLdelCont,
                      child: Text("確認刪除估價資訊",style: TextStyle(
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
      MaterialPageRoute(builder: (context) => commodAddPage()),
    );
  }
  _launchURLaddCont() async {
    final String U1 = quoteID.text;
    final String U2 = contactID.text;
    final String U3 = commodityID.text;
    final String U4 = quantityInfo.text;
    final String U5 = dateYear.text;
    final String U6 = dateMonth.text;
    final String U7 = dateDay.text;
    final String U8 = statusInfo.text;
    final String url = "http://192.168.1.117/ai2/add/quote.php?qno=$U1&nno=$U2&jno=$U3&quantity=$U4&qdate=$U5-$U6-$U7&status=$U8";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLupdCont() async {
    final String U1 = quoteID.text;
    final String U2 = contactID.text;
    final String U3 = commodityID.text;
    final String U4 = quantityInfo.text;
    final String U5 = dateYear.text;
    final String U6 = dateMonth.text;
    final String U7 = dateDay.text;
    final String U8 = statusInfo.text;
    final String url = "http://192.168.1.117/ai2/upd/quote.php?qno=$U1&nno=$U2&jno=$U3&quantity=$U4&qdate=$U5-$U6-$U7&status=$U8";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURLdelCont() async {
    final String U1 = quoteID.text;
    final String U2 = contactID.text;
    final String U3 = commodityID.text;
    final String U4 = quantityInfo.text;
    final String U5 = dateYear.text;
    final String U6 = dateMonth.text;
    final String U7 = dateDay.text;
    final String U8 = statusInfo.text;
    final String url = "http://192.168.1.117/ai2/upd/quote.php?qno=$U1";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}