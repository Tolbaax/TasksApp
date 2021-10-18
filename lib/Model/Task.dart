import 'package:task/Constants.dart';

class TaskModel {
  int? id;
  String? title;
  String? date;
  String? desc;
  String? importance;
  String? status;
  TaskModel(
      {this.date,
      this.title,
      this.desc,
      this.importance,
      this.status,
      this.id});

  toJson() {
    return {
      taskTitle: title,
      taskDate: date,
      taskDesc: desc,
      taskImportance: importance,
      taskStatus: status,
      taskId: id,
    };
  }
  TaskModel.fromJson(Map<String,dynamic> jsonTask)
  {
    id = jsonTask[taskId];
    title = jsonTask[taskTitle];
    desc = jsonTask[taskDesc];
    status = jsonTask[taskStatus];
    importance = jsonTask[taskImportance];
    date = jsonTask[taskDate];
  }
}
