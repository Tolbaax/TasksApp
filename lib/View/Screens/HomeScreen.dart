import 'package:flutter/material.dart';
import 'package:task/Controller/database_helper.dart';
import 'package:task/Model/Task.dart';
import 'package:task/View/Screens/AddTask.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [];
  DBHelper dbHelper = DBHelper();
  getTasks() {
    dbHelper.getAllTasks().then((v) {
      setState(() {
        tasks = v;
      });
    });
  }

  @override
  initState() {
    super.initState();
    getTasks();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTask.id);
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: getTasks(),
        builder:(context,s) => ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  child: ListTile(
                    title: Text(tasks[index].title!),
                    trailing: InkWell(
                        onTap: () async {
                          await dbHelper.deleteTask(tasks[index]);
                        },
                        child: Icon(Icons.delete)),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
