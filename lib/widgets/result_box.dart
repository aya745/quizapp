import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
  }) : super(key: key);
  final int result;
  final int questionLength;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backround,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Text(
                'Result', 
                style: TextStyle(color : neutral, fontSize: 22.0),
                ),
                const SizedBox(height: 20.0),
                CircleAvatar(
                  child: Text(
                    '$result/$questionLength', 
                    style: TextStyle(fontSize: 30.0 ),
                  ),
                  radius: 70.0,
                  backgroundColor: result == questionLength/2
                  ?Colors.yellow   //when the result equals half of the question
                  : result < questionLength/2
                  ? incorrect // when the result is less than half
                  : correct, // when the result is more than half
                ),
                const SizedBox(height: 20.0),
                Text(
                  result == questionLength/2
                    ?'Almost There'   //when the result equals half of the question
                    : result < questionLength/2
                      ? 'Try Again' // when the result is less than half
                      : 'Good Job!', // when the result is more than half 
                      style: const TextStyle(color: neutral),
                  ),
          ],
          )
          ),
    );
  }
}