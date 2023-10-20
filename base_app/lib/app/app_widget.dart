import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_commons/commons.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NfcAppUI.setPortraitOrientation();
    Modular.setInitialRoute(NfcRoutes.selectOperation);

    return MaterialApp.router(
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
            themeMode: ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            supportedLocales: const [Locale('pt', 'BR')],
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            theme: ThemeData(
                primaryColor: NfcColors.monoBlack,
                indicatorColor: NfcColors.monoBlack,
                progressIndicatorTheme: const ProgressIndicatorThemeData(
                    color: NfcColors.monoBlack, linearTrackColor: NfcColors.monoBlack),
                bottomNavigationBarTheme:
                    BottomNavigationBarThemeData(backgroundColor: Colors.transparent, elevation: 0),
                bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                brightness: Brightness.dark),
            darkTheme: ThemeData(highlightColor: Colors.transparent, splashFactory: NoSplash.splashFactory));
  }
}
