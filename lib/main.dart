import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fx3/model/athletes.dart';
import 'package:fx3/provider/language_provider.dart';
import 'package:fx3/provider/search_provider.dart';
import 'package:fx3/restart.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AthletesAdapter());
  await Hive.openBox<Athletes>("athletes");

  runApp(EasyLocalization(
      supportedLocales: const [Locale("en", "US"), Locale("ar", "AR")],
      saveLocale: true,
      path: 'assets/l10n',
      child: const RestartWidget(child: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LanguageProvider>(
            create: (_) => LanguageProvider()),
        ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'FX3',
        theme: themedata(),
        home: const HomeScreen(title: 'FX3 Club'),
      ),
    );
  }

  ThemeData themedata() {
    return ThemeData(
      primarySwatch: Colors.blue,
      indicatorColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, foregroundColor: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        floatingLabelStyle: const TextStyle(
            color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 18),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.red, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.black12, width: 0)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.black12, width: 0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.blue, width: 2)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.red, width: 2)),
      ),
      tabBarTheme: const TabBarTheme(
          overlayColor: MaterialStatePropertyAll(Colors.red),
          indicatorColor: Colors.red,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black38,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white),
      useMaterial3: true,
    );
  }
}
