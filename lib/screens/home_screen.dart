import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/next_button.dart';
import 'package:quiz_app/widgets/question_widget.dart';
import 'package:quiz_app/widgets/option_card.dart';
import 'package:quiz_app/widgets/result_box.dart';

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
  // create a score variable
  int score = 0;
  // create a boolean value to check if the user has clicked
  bool isPressed = false;
  // create a function to display the next question
  bool isAlreadySelected = false;
  void nextQuestion(){
    if(index == _questions.length -1){
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ResultBox(
          result : score, //total points the user got
          questionLength: _questions.length, // out of how many questions
          onPressed: startOver,
          ));
    } else{
    if(isPressed){
    
    setState(() {
      index++; //when the index will change to 1, rebuild the app.
      isPressed = false;
      isAlreadySelected=false;
    });
    } else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select an option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
          )
      );
    }
    
    }
  }
  
  // create a function for changing color
  void checkAnswerAndUpdate(bool value){
    if (isAlreadySelected){
      return;
    } else {
       if (value == true) {
      score++;
      setState(() {
        isPressed = true;
        isAlreadySelected=true;

    });
    }
    }
   
    
  }
  
  // create a function to start over
  void startOver(){
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 18.0),
              ),
              ),

        ],
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
                  GestureDetector(
                    onTap: () => checkAnswerAndUpdate(
                      _questions[index].options.values.toList()[i]),
                    child: OptionCard(
                      option: _questions[index].options.keys.toList()[i],
                      
                      color: isPressed
                        ? _questions[index].options.values.toList()[i] == true
                          ? correct 
                          : incorrect
                        : neutral,
                        
                      ),
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

