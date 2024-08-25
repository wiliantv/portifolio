import 'dart:async'; // Adicione esta importação para usar Timer
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/screens/about_screen.dart';
import 'package:portifolio/screens/contact_screen.dart';
import 'package:portifolio/screens/education_screen.dart';
import 'package:portifolio/screens/home_screen.dart';
import 'package:portifolio/screens/projects_screen.dart';
import 'package:portifolio/widgets/default_scaffold.dart';
import 'package:portifolio/widgets/drawer.dart';
import 'package:portifolio/widgets/theme_mode_button.dart';
import 'package:portifolio/widgets/typing_text.dart';

void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(child: HomeScreen()),
      ),
      GoRoute(
        path: '/about',
        pageBuilder: (context, state) => NoTransitionPage(child: AboutScreen()),
      ),
      GoRoute(
        path: '/education',
        pageBuilder: (context, state) => NoTransitionPage(child: EducationScreen()),
      ),
      GoRoute(
        path: '/projects',
        pageBuilder: (context, state) => NoTransitionPage(child: ProjectsScreen()),
      ),
      GoRoute(
        path: '/contact',
        pageBuilder: (context, state) => NoTransitionPage(child: ContactScreen()),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Portfólio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.light),
        textTheme: GoogleFonts.firaCodeTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.black87,
            displayColor: Colors.black87,
          ),
        ),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue, brightness: Brightness.dark),
        textTheme: GoogleFonts.encodeSansScTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        brightness: Brightness.dark,
      ),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      // home: HomeScreen(),
    );
  }
}
