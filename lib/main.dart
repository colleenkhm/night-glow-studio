import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'util.dart';
import 'theme.dart';
import 'app_header.dart';
import 'home.dart';
import 'library_screen.dart';
import 'studio_screen.dart';
import 'arcade_screen.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    TextTheme textTheme = createTextTheme(context, "DM Sans", "Fraunces");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner in the corner
      title: 'night glow studio',
      theme: theme.darkMediumContrast(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/studio': (context) => const StudioScreen(),
        '/library': (context) => const LibraryScreen(),
        '/arcade': (context) => const ArcadeScreen(),
      },
    );
  }
}

class BlankScreen extends StatelessWidget {
  const BlankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NsAppBar(),
      body: Center(
        child: Text('night glow studio', style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}