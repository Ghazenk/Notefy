import 'package:flutter/material.dart';
import 'package:practice_isar/providers/note_database.dart';
import 'package:practice_isar/providers/screen_switch.dart';
import 'package:provider/provider.dart';

var kLightScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: Color.fromARGB(255, 197, 97, 60),
);

var kDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 90, 27, 4),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.setupIsar();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => NoteDatabase())),
        ChangeNotifierProvider(create: ((context) => ScreenSwitch())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = context.watch<ScreenSwitch>().screen;

    return MaterialApp(
      theme: ThemeData().copyWith(colorScheme: kLightScheme),

      darkTheme: ThemeData.dark().copyWith(colorScheme: kDarkScheme),

      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: screen,
    );
  }
}
