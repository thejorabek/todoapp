import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/categories.dart';
import 'package:todo_app/core/repository/task_repository.dart';
import 'package:todo_app/core/models/categorys_model.dart';
import 'package:todo_app/core/models/task_model.dart';
part 'new_task_state.dart';

class AddingtaskCubit extends Cubit<AddingtaskState> {
  final Task_Crud taskModelRepository;

  AddingtaskCubit({required this.taskModelRepository})
      : super(AddingtaskInitial());

  bool isValidTask = false;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  int categoryIndex = 0;

  chooseCategory(int index) {
    categoryIndex = index;
    emit(ChoosedCategory());
  }

  Future<void> addNewTask({
    required String title,
    required String disc,
    required bool isCompleted,
  }) async {
    print("asdjnfiaufi: ${selectedDate}");
    print("asdjnfiaufi: ${selectedTime}");

    if (title.isNotEmpty && isValidTask) {
      List<CategoriesModel> catgList =
          Categories.get.map((e) => CategoriesModel.fromJson(e)).toList();
      String catg = catgList[categoryIndex].title!;

      String todoTime =
          selectedTime.hour.toString() + ":" + selectedTime.minute.toString();

      TaskModel newModel = TaskModel(
        category: catg.toString(),
        disc: disc,
        isComleted: isCompleted,
        time: todoTime,
        title: title,
        doNotify: false,
        date: selectedDate.toString(),
      );
      await taskModelRepository.saveTodo(newModel);
      emit(AddedTask());
      changeValidation();
    } else {
      emit(
        AddingtaskError("Sarlavha tanlanmadi!"),
      );
    }
  }

  changeValidation() {
    isValidTask = !isValidTask;
    emit(AddingTaskValidateState(isValidTask));
  }

  Future<void> selectDateAndTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: selectedDate,
      lastDate: DateTime(2101),
    );

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedDate != null) {
      selectedTime = pickedTime;
      selectedDate = pickedDate;
      isValidTask = true;

      emit(AddingTaskValidateState(isValidTask));
    } else {
      emit(
        AddingtaskError("Sana tanlanmadi!"),
      );
    }
  }
}
