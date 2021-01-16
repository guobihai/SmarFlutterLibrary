import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_library/orders/GoodsTabOrderInfo.dart';
import 'package:smart_library/orders/HomePageInfo.dart';
import 'package:smart_library/orders/TabOrderInfo.dart';
import 'package:smart_library/orders/gallery/GalleryPageInfo.dart';
import 'package:smart_library/routers/Routes.dart';
import 'dart:io';

import 'package:flutterboosts/flutterboost/flutter_boost.dart';
import 'orders/CenterPageInfo.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //将需要进行跳转的页面事先注册到FlutterBoost
    //pageName是路由名称，params是参数
    FlutterBoost.singleton.registerPageBuilders({
      ROUTE_GALLERY: (pageName, params, _) {
        print("========pageName:$pageName");
        print("========params:$params");
        return TabOrderInfo();
      },
      ROUTE_HOME: (pageName, params, _) {
        print("========pageName:$pageName");
        print("========params:$params");
        return GoodsTabOrderInfo();
      },
      ROUTE_CENTER: (pageName, params, _) => CenterPageInfo(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      home: TabOrderInfo(),
    );
  }

//从原生跳转到Flutter的动作都会经过这里，有需要的话可以在这里做一些统一的操作
  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
    print("========pageName:$pageName");
    print("========params:$params");
  }
}

class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color(int.parse("0xff151823"))),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings setting) {
        String routeName = setting.name;
        print("接收原始的路由信息：" + routeName);
        Routes praseRoutes = Routes.fromJson(setting.name);
        routeName = praseRoutes.name;
        print("解析后的路由名称：$routeName");
        print("解析后的路由参数：${praseRoutes.param}");

        switch (routeName) {
          case "/":
            return MaterialPageRoute(builder: (context) {
              return TabOrderInfo();
            });
          case "main_page":
            return MaterialPageRoute(builder: (context) {
              return TabOrderInfo();
            });
          case "gallery_page":
            return MaterialPageRoute(builder: (context) {
              return GalleryPageInfo();
            });
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return Scaffold(
                  body: Center(
                child: Text("Page not found"),
              ));
            });

          // ignore: missing_return
        }
      },
      // routes: {
      //   'main_page': (context) {
      //     return TabOrderInfo();
      //   },
      //   'gallery_page': (context) {
      //     return GalleryPageInfo();
      //   }
      // },
      home: new TabOrderInfo(),
    );
  }
}
