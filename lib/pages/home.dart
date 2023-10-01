import 'dart:math';

import 'package:bmi/pages/result.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool isMale = true;
  double hightVal = 170;
  int weight = 55;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Body Mass Index')),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    genderBox(context, 'Male'),
                    const SizedBox(
                      width: 19,
                    ),
                    genderBox(context, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            hightVal.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'cm',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Slider(
                        min: 90,
                        max: 220,
                        value: hightVal,
                        onChanged: (value) {
                          setState(() {
                            hightVal = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    WightAgeBox(context, 'weight'),
                    const SizedBox(
                      width: 19,
                    ),
                    WightAgeBox(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 15,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow(hightVal / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultPage(
                          result: result,
                          gender: isMale,
                          age: age,
                        );
                      },
                    ),
                  );
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded genderBox(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == 'Male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: (isMale && type == 'Male') || (!isMale && type == 'Female')
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'Male' ? Icons.male : Icons.female, size: 90),
              const SizedBox(
                height: 12,
              ),
              Text(
                type == 'Male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded WightAgeBox(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.add, size: 22),
                ),
                const SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  mini: true,
                  child: const Icon(Icons.remove, size: 22),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
