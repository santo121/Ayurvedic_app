import 'dart:io';

import 'package:ayurvedic_app/global/providers/notifier_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'global/config/db.config.dart';
import 'global/config/routes.config.dart';
import 'global/config/variables.config.dart';
import 'global/dependency_injection/di.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
   await Future.delayed(const Duration(milliseconds: 300));
  runApp( MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),);

     //*--- Hive
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<String>(DbKey.dbName);

  
}
GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context,child) {
        return Platform.isIOS
                ? CupertinoApp(
                    title: KString().appName,
                    routes: routes,
                    initialRoute: '/',
                    navigatorKey: navigationKey,
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: const [
                      DefaultWidgetsLocalizations.delegate,
                      DefaultMaterialLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                    ],
                  )
                : MaterialApp(
                    routes: routes,
                    title: KString().appName,
                    initialRoute: '/',
                    navigatorKey: navigationKey,
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                      useMaterial3: true,
                    ),
                  );
      },
                    designSize: const Size(430, 932),

    );
    
    

  }
}

