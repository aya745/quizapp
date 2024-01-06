import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/next_button.dart';
import 'package:quiz_app/widgets/question_widget.dart';
import 'package:quiz_app/widgets/option_card.dart';

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

  // create an index to loop through questions
  int index = 0;
  // create a boolean value to check if the user has clicked
  bool isPressed = false;
  // create a function to display the next question
  void nextQuestion(){
    if(index == _questions.length -1){
      return;
    } else{
    setState(() {
      index++; //when the index will change to 1, rebuild the app.
      isPressed = false;
    });
    }
  }
  
  // create a function for changing color
  void changeColor(){
    setState(() {
      isPressed = true;
    });
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
                // add some space
                const SizedBox(height: 25.0),
                for(int i=0; i< _questions[index].options.length;i++)
                  OptionCard(
                    option: _questions[index].options.keys.toList()[i],
                    color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                        ? correct 
                        : incorrect
                      : neutral,
                      onTap: changeColor,
                    ),

            
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

