import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.result,
    required this.gender,
    required this.age,
  });

  final double result;
  final bool gender;
  final int age;
  String get resultPhrase {
    String resultTest = '';
    if (result >= 30) {
      resultTest = 'Obese';
    } else if (result > 25 && result < 30) {
      resultTest = 'Over Weight';
    } else if (result > 18.5 && result <= 34.9) {
      resultTest = 'Normal';
    } else {
      resultTest = 'Thin';
    }
    return resultTest;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Result'))),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender: ${gender == true ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Result: ${result.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Healthiness: ${resultPhrase}',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              Text(
                'Age: ${age}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
