import 'package:flutter/material.dart';
import 'package:flutter_playground/basics/basic_eight.dart';
import 'package:flutter_playground/basics/basic_five.dart';
import 'package:flutter_playground/basics/basic_four.dart';
import 'package:flutter_playground/basics/basic_nine.dart';
import 'package:flutter_playground/basics/basic_one.dart';
import 'package:flutter_playground/basics/basic_seven.dart';
import 'package:flutter_playground/basics/basic_six.dart';
import 'package:flutter_playground/basics/basic_three.dart';
import 'package:flutter_playground/basics/basic_two.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playground App"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicOne(title: "Basic 1"),
                    ),
                  );
                },
                child: Text("Basic 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicTwo(title: "Basic 2"),
                    ),
                  );
                },
                child: Text("Basic 2"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicThree(title: "Basic 3"),
                    ),
                  );
                },
                child: Text("Basic 3"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicFour(title: "Basic 4"),
                    ),
                  );
                },
                child: Text("Basic 4"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicFive(title: "Basic 5"),
                    ),
                  );
                },
                child: Text("Basic 5"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicSix(title: "Basic 6"),
                    ),
                  );
                },
                child: Text("Basic 6"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicSeven(title: "Basic 7"),
                    ),
                  );
                },
                child: Text("Basic 7"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicEight(title: "Basic 8"),
                    ),
                  );
                },
                child: Text("Basic 8"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicNine(title: "Basic 9"),
                    ),
                  );
                },
                child: Text("Basic 9"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
