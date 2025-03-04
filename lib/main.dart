import 'package:color_palette_generator_app_flutter/controllers/providers/color_provider.dart';
import 'package:color_palette_generator_app_flutter/views/home_screen.dart';
import 'package:color_palette_generator_app_flutter/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/providers/theme_provider.dart';

void main() {
  runApp(
    const My_App(),
  );
}

class My_App extends StatefulWidget {
  const My_App({Key? key}) : super(key: key);

  @override
  State<My_App> createState() => _My_AppState();
}

class _My_AppState extends State<My_App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ColorProvider()),
      ],
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          initialRoute: 'Splash_Screen',
          routes: {
            'Home_Screen': (context) => const Home_Screen(),
            'Splash_Screen': (context) => const Splash_Screen(),
          },
        );
      },
    );
  }
}
