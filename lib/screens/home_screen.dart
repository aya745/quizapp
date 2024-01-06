import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/next_button.dart';
import 'package:quiz_app/widgets/question_widget.dart';


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
     options: {'5': false, '30': false, '4': true, '10': false},
    ),
    Question(
     id: '11',
     title: 'What is 10 + 20 ?', 
     options: {'50': false, '30': true, '40': false, '10': false},
    ),

  ];

  //create an index to loop through questions
  int index = 0;

  //create a function to display the next question
  void nextQuestion(){
    if(index == _questions.length -1){
      return;
    } else{
    setState(() {
      index++; //when the index will change to 1, rebuild the app.
    });
    }
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: backround ,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: backround,
        shadowColor: Colors.transparent,
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              //adding questionWidget here
              QuestionWidget(
                indexAction: index, //currently at 0
                question: _questions[index].title, //first in the list
                totalQuestions: _questions.length, //total length of the list
                ),
                const Divider(color: neutral),
            ],
          ),
         ),


         floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: NextButton(
            nextQuestion: nextQuestion,
            ),
         ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

