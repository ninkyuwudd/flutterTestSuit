import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testflutter/data/provider/palidrome_provider.dart';
import 'package:testflutter/data/provider/user_provider.dart';
import 'package:testflutter/presentation/palidrome/palidrome_page.dart';
import 'package:testflutter/utils/routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => PalidromeProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2B637B)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: Routes,
    );
  }
}
