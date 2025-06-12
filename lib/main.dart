import 'package:flutter/material.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/pages/approach_timer.dart';
import 'package:musleapp/pages/break_page.dart';
import 'package:musleapp/pages/main_page.dart';
import 'package:musleapp/pages/meal_list_page.dart';
import 'package:musleapp/pages/statistics_screen.dart';
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
      home: const HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomeScreen(), 
        '/start': (BuildContext context) => new TrainingStart(),
        '/timer': (BuildContext context) => new ApproachTimer(),
        '/break': (BuildContext context) => new BreakPage(),
        '/over': (BuildContext context) => new TrainingOver(),
        '/stat': (BuildContext context) => new StatisticsScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MainPage(),
    StatisticsScreen(),
    MealListPage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: BouncingScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        backgroundColor: backgroundColor,
        selectedItemColor: textButtonColor, // выделенный элемент — КРАСНЫЙ
        unselectedItemColor: Colors.grey, // остальные — серые
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Тренировка',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Статистика',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Еда',
          ),
        ],
      ),
    );
  }
}
