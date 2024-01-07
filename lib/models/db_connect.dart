import 'package:http/http.dart' as http;
import 'question_model.dart';
import 'dart:convert';

class DBconnect{

  
  final url= Uri.parse('https://quizapp-cb90d-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question question) async {
    http.post(url,body: json.encode({
      'title': question.title,
      'options': question.options,
    }));
  }


  


}