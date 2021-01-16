import 'dart:convert';

const String ROUTE_GALLERY = "homeGallery";
const String ROUTE_HOME = "home";
const String ROUTE_CENTER = "center";

class Routes {
  String name;
  String param;

  Routes({this.name, this.param});

  factory Routes.fromJson(String data) {
    if (!data.startsWith("{") && !data.endsWith("}"))
      return Routes(name: "/", param: "");
    Map<String, dynamic> map = json.decode(data);
    return Routes(name: map['name'], param: map['param']);
  }
}
