import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness==Brightness.dark?"DarkTheme":"LightTheme";

    return  Scaffold(
      appBar: AppBar(
        title: const Text("Appbar",style: TextStyle(
        ),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(text),
          ),
          ElevatedButton(onPressed: (){}, child: const Text("Text"))
        ],
      ),
    );
  }
}

class MyThemes {
  static final darkTheme = ThemeData(scaffoldBackgroundColor: Colors.grey.shade900,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith((states) => Colors.purple)
          )
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(fontSize: 20),
        bodyText2: TextStyle(fontSize: 20),
      ).apply(
        bodyColor: Colors.purple,
        displayColor: Colors.blue,
      ),
      colorScheme: const ColorScheme.dark(),
      buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.dark(background: Colors.pink)),
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(foregroundColor: Colors.white,color: Colors.purple)
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue)
        )
    ),
    buttonTheme: const ButtonThemeData(colorScheme: ColorScheme.light(background: Colors.blue,)),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    appBarTheme: const AppBarTheme(foregroundColor: Colors.white,color: Colors.blue),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 20),
      bodyText2: TextStyle(fontSize: 20),
    ).apply(
      bodyColor: Colors.orange,
      displayColor: Colors.blue,
    ),
  );
}