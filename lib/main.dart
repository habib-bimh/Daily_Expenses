import 'package:flutter/material.dart';
import 'widgets/expenses.dart';
//import 'package:flutter/services.dart'; this package for devics orientation
var kcolorScheme= ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
var KdarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125));
void main() {
  // all code for devics orientation rotayed not **
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //   ]
  // ).then((value) {
  // runApp(const MyApp());
  // });
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: KdarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: KdarkColorScheme.secondaryContainer,
          margin:const  EdgeInsets.symmetric(horizontal:16,vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: KdarkColorScheme.primaryContainer,
            foregroundColor: KdarkColorScheme.onPrimaryContainer
          )),
          
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kcolorScheme,
        appBarTheme:const  AppBarTheme().copyWith(
          backgroundColor: kcolorScheme.onPrimaryContainer,
          foregroundColor: kcolorScheme.primaryContainer
        ),
        cardTheme: const CardTheme().copyWith(
          color: kcolorScheme.secondaryContainer,
          margin:const  EdgeInsets.symmetric(horizontal:16,vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.primaryContainer
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: kcolorScheme.secondary)
        )
        ),
        themeMode: ThemeMode.system,
      home: Expenses(),
    );
  }
}

