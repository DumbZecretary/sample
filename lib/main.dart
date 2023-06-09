import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;
  late int index;
  @override
  void initState() {
    pageController = PageController();
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          Container(
            color: Colors.red,
            width: 200,
            height: 200,
          ),
          Container(
            color: Colors.blue,
            width: 200,
            height: 200,
          ),
          Container(
            color: Colors.yellow,
            width: 200,
            height: 200,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
            pageController.animateToPage(value,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          });
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified),
            label: "Verification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shield),
            label: "Shield",
          ),
        ],
      ),
    );
  }
}
