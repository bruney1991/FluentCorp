import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/welcome_questionnaire_screen.dart';
import 'screens/home_screen.dart';
import 'screens/flashcards_screen.dart';
import 'screens/conversation_screen.dart';
import 'screens/music_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(LanguageLearningApp());
}

class LanguageLearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aprendizado de Idiomas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,

      // Aqui tratamos rotas com parâmetros
      onGenerateRoute: (settings) {
        if (settings.name == '/welcome-questionnaire') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => WelcomeQuestionnaireScreen(
              userName: args['userName'],
            ),
          );
        }

        if (settings.name == '/main') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => MainScreen(
              userName: args['userName'],
            ),
          );
        }

        return null;
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  final String userName;

  const MainScreen({Key? key, required this.userName}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(userName: widget.userName),
      FlashcardsScreen(),
      ConversationScreen(),
      MusicScreen(),
      ProfileScreen(userName: widget.userName),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue[600],
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.style),
            label: 'Flashcards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Conversação',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Músicas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
