import 'package:flutter/material.dart';

//Pages
import 'package:flutter_app3/src/pages/alert_page.dart';
import 'package:flutter_app3/src/pages/animated_container.dart';
import 'package:flutter_app3/src/pages/avatar_page.dart';
import 'package:flutter_app3/src/pages/card_page.dart';
import 'package:flutter_app3/src/pages/home_page.dart';
import 'package:flutter_app3/src/pages/input_page.dart';
import 'package:flutter_app3/src/pages/listview_page.dart';
import 'package:flutter_app3/src/pages/slider_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {
      '/'       : (BuildContext context) => HomePage(),
      AlertPage.pageName  : (BuildContext context) => AlertPage(),
      AvatarPage.pageName  : (BuildContext context) => AvatarPage(),
      CardPage.pageName    : (BuildContext context) => CardPage(),
      AnimatedContainerPage.pageName : (BuildContext context) => AnimatedContainerPage(),
      InputPage.pageName : (BuildContext context) => InputPage(),
      SliderPage.pageName  : (BuildContext context) => SliderPage(),
      ListaPage.pageName  : (BuildContext context) => ListaPage(),
  };

}



