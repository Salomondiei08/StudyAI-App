import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'chatpdf_screen.dart';
import 'flashcard_screen.dart';
import 'home_screen.dart';
import 'recommandation_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> bodyItems = const [
    HomeScreen(),
    FlashCardScreen(),
    ChatScreen(),
    ChatPdfScreen(),
    RecommandationScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyItems[currentIndex],
      bottomNavigationBar:
       BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: const Color(0xFF27354B),
        unselectedItemColor: Colors.black.withOpacity(.60),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.sim_card_download_sharp),
              label: "Home",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_rounded),
              label: "PDF Chat",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              label: "Recommandation",
              backgroundColor: Colors.white),
        ],
        onTap: (index) => {setState(() => currentIndex = index)},
      ),
    
    
    )
    ;
  }
}
