import 'package:flutter/material.dart';
import 'package:task/View/Screens/AddTask.dart';
import 'package:task/View/Screens/HomeScreen.dart';

void main()
{
  runApp(MyTask());
}

class MyTask extends StatelessWidget {
  const MyTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id:(context)=>HomeScreen(),
        AddTask.id:(context)=>AddTask(),
      },
    );
  }
}
