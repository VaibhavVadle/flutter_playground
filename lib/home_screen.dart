import 'package:flutter/material.dart';
import 'package:flutter_playground/examples/example_one.dart';
import 'package:flutter_playground/examples/example_three.dart';
import 'package:flutter_playground/examples/example_two.dart';

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
                      builder: (context) => ExampleOne(title: "Example 1"),
                    ),
                  );
                },
                child: Text("Example 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExampleTwo(title: "Example 2"),
                    ),
                  );
                },
                child: Text("Example 2"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExampleThree(title: "Example 3"),
                    ),
                  );
                },
                child: Text("Example 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
