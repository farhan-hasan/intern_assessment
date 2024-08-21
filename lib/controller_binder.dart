import 'package:get/get.dart';
import 'package:intern_assessment/controllers/task_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskController());
  }
}