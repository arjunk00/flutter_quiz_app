import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  } 
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override //init state is used because setting active screen widget and setstate runs almost simultaneously
  //which means that active screen may be unavailable when we are setting state. to avoid that we first
  //initialize the active screen then set state below.
  void initState() {
    activeScreen = HomePage(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 61, 11, 161),
                Color.fromARGB(255, 119, 75, 232)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}