import 'package:flutter/material.dart';
import 'package:testflutter/presentation/details/detail_page.dart';
import 'package:testflutter/presentation/lisUser/list_page.dart';
import 'package:testflutter/presentation/palidrome/palidrome_page.dart';

Map<String, WidgetBuilder> Routes = {
  '/': (context) => const ChekingPalidrome(),
  '/detail': (context) => const DetailPage(),
  '/listUser': (context) => const ListUserPage()
};
