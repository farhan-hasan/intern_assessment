import 'dart:developer';
import 'dart:ui';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intern_assessment/controllers/task_controller.dart';
import 'package:intern_assessment/models/task_data_model.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final List<DateTime?>_dates = [];
  String startTime = '10 AM';
  String endTime = '11 AM';
  String taskTitle = "";
  String date = DateTime.now.toString();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _taskNameTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalendarDatePicker2(
                  config: CalendarDatePicker2Config(),
                  value: _dates,
                  onValueChanged: (dates) {
                    for(DateTime dateTime in dates) {
                      log(date.toString());
                      if(dateTime!=null)date = dateTime.toString();
                    }
                  }
              ),
              const SizedBox(height: 16,),
              const Text("Task Title", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Form(
                key: _formkey,
                child: SizedBox(
                  height: 70,
                  child: TextFormField(
                    controller: _taskNameTEC,
                    decoration: InputDecoration(
                      hintText: 'UI/UX Design',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter task title";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              const Text("Category", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Wrap(
                runSpacing: 8,
                children: [
                  SizedBox(
                    height: 60,
                    width: 150,
                    child: ElevatedButton(onPressed: () {}, child: const Center(child: Text("All",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))))
                  ),
                  const SizedBox(width: 8,),
                  SizedBox(
                      height: 60,
                      width: 150,
                      child: ElevatedButton(onPressed: () {}, child: const Center(child: Text("UI/UX",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))))
                  ),const SizedBox(width: 8,),
                  SizedBox(
                      height: 60,
                      width: 150,
                      child: ElevatedButton(onPressed: () {}, child: const Center(child: Text("Web Development",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))))
                  ),const SizedBox(width: 8,),
                  SizedBox(
                      height: 60,
                      width: 150,
                      child: ElevatedButton(onPressed: () {}, child: const Center(child: Text("Digital Marketing",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))))
                  ),const SizedBox(width: 8,),
                  SizedBox(
                      height: 60,
                      width: 150,
                      child: ElevatedButton(onPressed: () {}, child: const Center(child: Text("Product Design",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))))
                  ),
                ],
              ),
              const SizedBox(height: 16,),
              Wrap(
                children: [
                  SizedBox(
                    width:MediaQuery.of(context).size.width/3 ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Starts", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        DropdownButton<String>(
                          value: startTime,
                          icon: const Icon(Icons.arrow_downward, color:Colors.black,),
                          elevation: 16,
                          style:  const TextStyle(color: Colors.black,),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              startTime = newValue!;
                            });
                          },
                          items: <String>['10 AM', '11 AM', '12 AM', '1 PM', '2 PM', '3 PM', '4 PM', '5 PM','6 PM','7 PM','8 PM','9 PM','10 PM']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 24,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Ends", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        DropdownButton<String>(
                          value: endTime,
                          icon: const Icon(Icons.arrow_downward, color:Colors.black,),
                          elevation: 16,
                          style:  const TextStyle(color: Colors.black,),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              endTime = newValue!;
                            });
                          },
                          items: <String>['10 AM', '11 AM', '12 AM', '1 PM', '2 PM', '3 PM', '4 PM', '5 PM','6 PM','7 PM','8 PM','9 PM','10 PM']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16,),
              GetBuilder<TaskController>(
                builder: (taskController) {
                  return ElevatedButton(onPressed: () {
                    TaskDataModel newTask = TaskDataModel(startTime: "", endTime: "", taskTitle: "");
                    if (_formkey.currentState!.validate()) {
                      newTask.endTime = endTime;
                      newTask.startTime = startTime;
                      newTask.taskTitle = _taskNameTEC.text.trim();
                      taskController.addTask(date, newTask);
                      log(taskController.taskList.toString());
                    }
                  }, child: const Center(child: Text("Create Task")));
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
