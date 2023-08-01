import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Data = await task2();
  task3(task2Data);
}

void task1() {
  String result = 'task 1 data';
  print('task 1 completed');
}

Future<String> task2() async {
  Duration threeSeconds = const Duration(seconds: 3);
  String? result;
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('task 2 completed');
  });
  return result!;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('task 3 completed $task2Data');
}
