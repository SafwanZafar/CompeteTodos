import 'dart:js';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class TodoProvider extends ChangeNotifier {
  TextEditingController todoTextField = TextEditingController();
  List<String> final_result = [];
  List<Map<String, dynamic>> todos = [];
  TextEditingController updatetodo = TextEditingController();


  String dateformat() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return formattedDate;  // Output will be in 'yyyy-MM-dd' format
  }

  void add() {
    //final_result.add(todoTextField.text);

    todos.add({
      "title": todoTextField.text,
      "isCompleted": false,
      "date":dateformat(),
    });
    todoTextField.clear();
    notifyListeners();
  }

  void remove(int index) {
    print(todoTextField.text);
    final_result.removeAt(index);
    notifyListeners();
  }

  void complete(int index) {
    todos.elementAt(index)["isCompleted"] = true;
    notifyListeners();
  }
  void dell(int index ){
    todos.removeAt(index)["title"];
    notifyListeners();
  }

  Widget custombutton(BuildContext context, String text,int index) {
    return ElevatedButton(
      onPressed: () {
        switch (text.toLowerCase()) {
          case "edit":
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Todos Updates",style: TextStyle(color:Colors.black),),
                  content: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(12)
                      )
                  ),
                    controller:updatetodo,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add update logic here
                        Navigator.pop(context);
                        updateTodoTitle(index, updatetodo.text);
                        updatetodo.clear();
                      },
                      child: Text("Update"),
                    ),
                  ],
                );
              },
            );
            break;
          default:
            dell(index); // Assuming dell is a function to delete something
        }
      },
      child: Text(text),
    );
  }

  void updateTodoTitle(int index, String newTitle) {
    todos[index]["title"] = newTitle;
    notifyListeners();
  }
}
