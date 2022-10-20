import 'package:flutter/material.dart';
import 'package:painel_richpay/colors.dart';
import 'package:provider/provider.dart';
import 'package:painel_richpay/views/main_screen.dart';
import 'package:painel_richpay/controllers/MenuController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RichPay Admin',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),

      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}


