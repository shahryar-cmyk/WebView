import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
main()=>runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   int currentTab = 1;
   void splitScreen(int i) {
    switch (i) {
      case 0:
        FlutterWebviewPlugin().goBack();
        break;
      case 1:
        FlutterWebviewPlugin().reload();
        break;
      case 2:
        FlutterWebviewPlugin().goForward();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter WebView Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (_) => new WebviewScaffold(
              url: "https://www.lucrurile-care-conteaza-cel-mai-mult.ro/",
              // appBar: new AppBar(
              //   title: new Text("Widget webview"),
                
              // ),
              
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              initialChild: Center(
                child: Container(
                  height: 210,
                  width: 200,
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.black87,
                    //       blurRadius: 10.0,
                    //       spreadRadius: 0.5,
                    //       offset: Offset.fromDirection(10)),
                    // ],
                    image: DecorationImage(
                        image: AssetImage(
                          'images/3f2c979b214d06e9caab8ba8326864f3.gif',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentTab,
                onTap: (i) {
                  splitScreen(i);
                  setState(() {
                    currentTab = i;
                  });
     
    },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_back_ios),
                    title: Text('Back'),
                    backgroundColor: Colors.blue,
                  ),
                   BottomNavigationBarItem(
                    icon: Icon(Icons.refresh),
                    title: Text('Refresh'),
                    backgroundColor: Colors.blue,
                  ), BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_forward_ios),
                    title: Text('Forward'),
                    backgroundColor: Colors.blue,
                  ),
                ],
              ),
            ),
      },
    );
  }
}