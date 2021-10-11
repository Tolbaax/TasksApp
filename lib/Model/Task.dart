import 'package:task/Constants.dart';

class TaskModel
{
  int? id;
  String? title;
  String? date;
  String? desc;
  String? importance;
  String? status;
  TaskModel({this.date,this.title,this.desc,this.importance,this.status,this.id});

  toJson()
  {
    return{
      taskTitle:title,
      taskDate:date,
      taskDesc:desc,
      taskImportance:importance,
      taskStatus:status,
      taskId:id,

    };
  }
}