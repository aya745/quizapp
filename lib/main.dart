import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import 'screens/home_screen.dart';  
import 'package:quiz_app/models/db_connect.dart';
void main(){
  var db = DBconnect();
  db.addQuestion(
    Question(id: '10', title: 'What is 20 x 100 ?', options: {
      '100': false,
      '200': true,
      '300': false,
      '500':false,
    }));

  runApp(
    const MyApp(),

  );
}

//create the MyApp widget
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}