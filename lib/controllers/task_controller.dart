import 'package:get/get.dart';

import '../models/task_data_model.dart';

class TaskController extends GetxController {
  bool inProgress = false;
  late Map<String,TaskDataModel> taskList = {"": TaskDataModel(startTime: '', endTime: '', taskTitle: '')};

  void addTask(String date, TaskDataModel task) {
    taskList[date] = task;
  }

  void fetchTasks() {

  }

}