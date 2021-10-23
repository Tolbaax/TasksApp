import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: AppBar(
        title: Center(child: Text('Tolba Tasks',style:
        GoogleFonts.acme(color: Colors.black,fontSize: 35),)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getTasks(),
        builder: (context, s) => ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(color: Colors.deepPurple),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(tasks[index].title.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                            Text(tasks[index].desc.toString(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(value: tasks[index].status=='0'?false:true, onChanged: (v)
                            {
                              setState(() {
                                if(tasks[index].status=='0')
                                {
                                  tasks[index].status='1';
                                }
                                else{
                                  tasks[index].status='0';
                                }
                                dbHelper.updateTask(tasks[index]);
                              });
                            }),
                            InkWell(
                                onTap: ()async
                                {
                                  await dbHelper.deleteTask(tasks[index]);
                                },
                                child: Icon(Icons.delete)),
                            Text(tasks[index].date.toString(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
              );
            }),
      ),
    );
  }
}