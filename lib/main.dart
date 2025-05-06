import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/pages/approach_timer.dart';
import 'package:musleapp/pages/break_page.dart';
import 'package:musleapp/pages/main_page.dart';
import 'package:musleapp/pages/statistics_screen.dart';
import 'package:musleapp/pages/test.dart';
import 'package:musleapp/pages/training_over.dart';
import 'package:musleapp/pages/training_start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Musle Up',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        primarySwatch: Colors.yellow,
      ),
      home: const MainPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MainPage(),
        '/start': (BuildContext context) => new TrainingStart(),
        '/timer': (BuildContext context) => new ApproachTimer(),
        '/break': (BuildContext context) => new BreakPage(),
        '/over': (BuildContext context) => new TrainingOver(),
        '/stat': (BuildContext context) => new StatisticsScreen(),
        '/test': (BuildContext context) => new AddProgressScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('Mussle app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
