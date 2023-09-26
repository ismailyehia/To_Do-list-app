import 'package:flutter/material.dart';
import 'package:pr3/models/task_data.dart';
import 'package:pr3/screens/screen.dart';

import 'models/task.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => TaskData(),
      child: MaterialApp(
        home:TaskScreen(),
      ),
    );
  }
}
    

