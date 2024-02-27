import 'package:flutter/cupertino.dart';

class TodoProvider extends ChangeNotifier{
TextEditingController todoTextField = TextEditingController();
List<String> final_result = [];

void add(){

  final_result.add(todoTextField.text);
  todoTextField.clear();
  notifyListeners();
}
void remove(int index){
  print(todoTextField.text);
  final_result.removeAt(index);
  notifyListeners();
}
}