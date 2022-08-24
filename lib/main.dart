import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:kurly_shopping_cart_app/routes/bindings.dart';
import 'package:kurly_shopping_cart_app/routes/pages.dart';
import 'package:kurly_shopping_cart_app/ui/theme/colors.dart';
import 'routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: KurlyColors.white,
    ),
    initialRoute: Routes.SPLASH,
    defaultTransition: Transition.cupertino,
    getPages: KurlyPages.pages,
    initialBinding: InitialBinding(),
    // ignore: prefer_const_literals_to_create_immutables
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    // ignore: prefer_const_literals_to_create_immutables
    supportedLocales: [
      const Locale('ko', 'KR'),
    ],
    // translationsKeys: AppTranslation.translations,
  ));
}
