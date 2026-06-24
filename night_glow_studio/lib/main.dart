import 'package:flutter/material.dart';
import 'util.dart';
import 'theme.dart';
import 'app_header.dart';
import 'home.dart';
import 'words_screen.dart';
import 'music_screen.dart';
import 'games_screen.dart';
import 'about_screen.dart';

void main() {
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
      title: 'broken curfew studio',
      theme: theme.darkMediumContrast(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/create': (context) => const WordsScreen(),
        '/explore': (context) => const MusicScreen(),
        '/arcade': (context) => const GamesScreen(),
        '/about': (context) => const AboutScreen(),
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