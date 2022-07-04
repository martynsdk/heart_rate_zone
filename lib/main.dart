import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';
import 'package:heart_rate_zone/page/health_tips.dart';
import 'package:heart_rate_zone/page/home_page.dart';
import 'package:heart_rate_zone/page/profile_page.dart';
import 'package:heart_rate_zone/page/settings_page.dart';
import 'package:heart_rate_zone/widget/animated_rail_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Heart Rate Zone';

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return MaterialApp(
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

        if (locale?.languageCode == 'pt') {
          return const Locale('pt', 'BR');
        }

        return const Locale('en', 'US');
      },
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: "Heart Rate Zone",
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.green,
        secondaryHeaderColor: Colors.greenAccent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: const MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  bool isExtended = true;

  //final selectedColor = Colors.white;
  //final unselectedColor = Colors.white60;
  //final labelStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 40);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NavigationRail(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              extended: isExtended,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              leading: Material(
                clipBehavior: Clip.hardEdge,
                shape: const CircleBorder(),
                child: Ink.image(
                  width: 62,
                  height: 62,
                  fit: BoxFit.fill,
                  image: const NetworkImage(
                    'https://images.unsplash.com/photo-1543362906-acfc16c67564?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
                  ),
                  child: InkWell(
                    onTap: () => setState(() => isExtended = !isExtended),
                  ),
                ),
              ),
              trailing: AnimatedRailWidget(
                child: isExtended
                    ? Row(
                  children: const [
                    Icon(
                      Icons.logout,
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
                    : const Icon(Icons.logout),
              ),
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(Icons.home),
                  label: Text("home_page".i18n()),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.favorite_border),
                  selectedIcon: const Icon(Icons.favorite),
                  label: Text("health_tips".i18n()),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.face),
                  label: Text("profiles".i18n()),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.settings),
                  label: Text("settings".i18n()),
                ),
              ],
            ),
            Expanded(child: buildPages())
          ],
        ),
      ),
    );


  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const HealthTips();
      case 2:
        return const ProfilePage();
      case 3:
        return const SettingsPage();
      default:
        return const HomePage();
    }
  }
}
