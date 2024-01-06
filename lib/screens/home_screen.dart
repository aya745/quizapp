import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question_model.dart';

//create homescreen widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Question> _questions = [
    Question(
     id: '10',
     title: 'What is 2 + 2 ?', 
     options: {'5': false, '30': false, '4': true, '10';false},
    ),
    Question(
     id: '11',
     title: 'What is 10 + 20 ?', 
     options: {'50': false, '30': true, '40': false, '10';false},
    ),

  ];

  //create an index to loop through questions
  int index = 0;
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: backround ,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: backround,
        shadowColor: Colors.transparent,
        ),
    );
  }
}

