import 'dart:developer';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intern_assessment/controllers/task_controller.dart';
import 'package:intern_assessment/models/task_data_model.dart';
import 'package:intern_assessment/screens/new_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DateTime?>_dates = [];
  String currentDate = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(),
                value: _dates,
                onValueChanged: (dates) {
                  for(DateTime date in dates) {
                    log(date.toString());
                    currentDate = date.toString();
                  }
                }
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GetBuilder<TaskController>(
                  builder: (taskController) {
                    return ListView.builder(
                      primary: false,
                      itemCount: taskController.taskList.length,
                      itemBuilder: (context, index) {
                          return  SizedBox(
                            height: 100,
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                title: Text(taskController.taskList[currentDate]!.taskTitle),
                                leading: Text("10 AM"),
                              ),
                            ),
                          );
                        }
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=> NewTaskScreen());
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(Icons.add),
      ),
    );
  }
}