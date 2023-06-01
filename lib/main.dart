import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tripbooking/page/login.dart';
import 'package:tripbooking/provider/appdata.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  Intl.defaultLocale = 'th';
  // initializeDateFormatting();

  // ให้ App เราสามารถเข้าถึง Provider ได้
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AppData(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme:
              GoogleFonts.notoSansThaiTextTheme(Theme.of(context).textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('th', 'TH')],
        home: LoginPage());
  }
}
