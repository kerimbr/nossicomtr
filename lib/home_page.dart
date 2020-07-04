import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  WebViewController _webViewController;
  String url = "https://www.nossi.com.tr/";

  Completer<WebViewController> _controller = Completer<WebViewController>();

  int menuItemId = 1;
  bool _loadingPageController=false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
            "Nossi ® Güvenli Alışverişin Adresi",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300
          ),
        ),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: RefreshIndicator(
          onRefresh: _yenile,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 51),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 55,
                child: Image.asset("assets/nossi_logo.png",fit: BoxFit.cover,),
              ),
              Text(
                "Nossi ® Güvenli Alışverişin Adresi",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                ),
              ),
              Divider(),

              ListTile(
                title: Text("Sıkça Sorulan Sorular"),
                leading: Icon(
                  MaterialCommunityIcons.frequently_asked_questions,
                  color: Colors.deepOrange,
                ),
                onTap: () async {
                  await _webViewController.loadUrl("https://www.nossi.com.tr/ac/sss");
                  Navigator.pop(context);

                },
              ),

              ListTile(
                title: Text("Sipariş Takibi"),
                leading: Icon(
                  MaterialCommunityIcons.truck_delivery,
                  color: Colors.deepOrange,
                ),
                onTap: () async {
                  await _webViewController.loadUrl("https://www.nossi.com.tr/ac/siparistakip");
                  Navigator.pop(context);

                },
              ),

              ListTile(
                title: Text("Hakkımızda"),
                leading: Icon(
                  Entypo.info,
                  color: Colors.deepOrange,
                ),
                onTap: () async {
                  await _webViewController.loadUrl("https://www.nossi.com.tr/ic/hakkimizda");
                  Navigator.pop(context);

                },
              ),

              ListTile(
                title: Text("İletişim"),
                leading: Icon(
                  AntDesign.contacts,
                  color: Colors.deepOrange,
                ),
                onTap: () async {
                  await _webViewController.loadUrl("https://www.nossi.com.tr/ac/iletisim");
                  Navigator.pop(context);
                },
              ),


              Divider(),
              ListTile(
                title: Text(
                    "Sipariş ve Destek",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                subtitle: Text(
                  "0850 303 50 45",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 16
                  ),
                ),
                onTap: (){
                  launch("tel://08503035045");
                },
              ),

              ListTile(
                title: Text(
                  "E-Posta",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
                subtitle: Text(
                  "info@nossi.com.tr",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16
                  ),
                ),
                onTap: (){
                  launch("mailto:info@nossi.com.tr");
                },
              ),
              SizedBox(height: 50),
              Text(
                "© Copyright 2017-2020 NOSSİ Bilişim Teknolojileri Gıda İnşaat ve Aracılık Hizmetleri Tic.Ltd.Şti. Her Hakkı Saklıdır.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade700
                ),
              )
            ],
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Feather.shopping_cart),
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () async {
         await _webViewController.loadUrl("https://www.nossi.com.tr/ac/sepet");
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade800,
        elevation: 12,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 5),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  onTap: () async {
                    await _webViewController.loadUrl(url);
                    setState(() {
                      menuItemId = 1;
                    });
                  },
                  child: Container(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Icon(
                          AntDesign.home,
                          size: 27,
                          color: menuItemId==1?Colors.deepOrange:Colors.white,
                        ),
                        Text(
                          "Keşfet",
                          style: TextStyle(
                              color: menuItemId==1?Colors.deepOrange:Colors.white,
                              fontSize: 11
                          ),
                        ),
                        // SizedBox(width: 25),
                      ],
                    ),
                  ),
                )
            ),
            Container(
                padding: EdgeInsets.only(left: 5),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  onTap: () async {
                    await _webViewController.loadUrl("https://www.nossi.com.tr/ac/arama");
                    setState(() {
                      menuItemId = 2;
                    });
                  },
                  child: Container(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Icon(
                          AntDesign.search1,
                          size: 27,
                          color: menuItemId==2?Colors.deepOrange:Colors.white,
                        ),
                        Text(
                          "Ara",
                          style: TextStyle(
                              color: menuItemId==2?Colors.deepOrange:Colors.white,
                              fontSize: 11
                          ),
                        ),
                        // SizedBox(width: 25),
                      ],
                    ),
                  ),
                )
            ),
            SizedBox(width: 50),

            Container(
                padding: EdgeInsets.only(left: 5),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  onTap: () async {
                    await _webViewController.loadUrl("https://www.nossi.com.tr/ac/showOrders");
                    setState(() {
                      menuItemId = 3;
                    });
                  },
                  child: Container(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Icon(
                          Entypo.shopping_bag,
                          size: 27,
                          color: menuItemId==3?Colors.deepOrange:Colors.white,
                        ),
                        Text(
                          "Siparişlerim",
                          style: TextStyle(
                              color: menuItemId==3?Colors.deepOrange:Colors.white,
                              fontSize: 11
                          ),
                        ),
                        // SizedBox(width: 25),
                      ],
                    ),
                  ),
                )
            ),
            Container(
                padding: EdgeInsets.only(left: 5),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  onTap: () async {
                    await _webViewController.loadUrl("https://www.nossi.com.tr/ac/profile");
                    setState(() {
                      menuItemId = 4;
                    });
                  },
                  child: Container(
                    width: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Icon(
                          FontAwesome.user_o,
                          size: 27,
                          color: menuItemId==4?Colors.deepOrange:Colors.white,
                        ),
                        Text(
                          "Hesabım",
                          style: TextStyle(
                              color: menuItemId==4?Colors.deepOrange:Colors.white,
                              fontSize: 11
                          ),
                        ),
                        // SizedBox(width: 25),
                      ],
                    ),
                  ),
                )
            ),

          ],
        ),
      ),


      body: FutureBuilder(
        future: _loadingPage(),
        builder: (context,ss){
          if(ss.hasData){
            return WillPopScope(
              onWillPop: () async{
                if(await _webViewController.canGoBack()){
                  _webViewController.goBack();
                  return false;
                }else{
                  return false;
                }
              },
              child: SafeArea(
                child: WebView(
                  onWebViewCreated: (WebViewController c){
                    _webViewController = c;
                    _controller.complete(c);
                  },

                  initialUrl: "https://www.nossi.com.tr/",
                  javascriptMode: JavascriptMode.unrestricted,

                ),
              ),
            );
          }else{
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: CupertinoActivityIndicator(
                  radius: 22,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> _yenile() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  Future<bool> _loadingPage() async{
    await Future.delayed(Duration(seconds: 1));
    _loadingPageController = true;
    return _loadingPageController;
  }


 /* _sepeteGit(){
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder: (BuildContext context, AsyncSnapshot<WebViewController> controller){
        if(controller.hasData){
          controller.data.loadUrl("https://www.nossi.com.tr/ac/sepet");
        }else{

        }
      },
    );
  }
*/

}
