import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/TodoApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',

        home:MyHomePage(title: "Flutter App"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Todo app",style: TextStyle(fontSize: 25,color: Colors.black),),
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: provider.todoTextField,
                decoration: const InputDecoration(
                  hintText: 'Enter your todo...',
                  border: OutlineInputBorder(
                  ),
                ),
              ),
            ),

            if (provider.todos.isEmpty) const Center(child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("No Todo Yet"),
            ),) else Expanded(
              child: ListView.builder(
                itemCount: provider.todos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                        provider.todos[index]["title"].toString(),
                        style: TextStyle(
                          color: (provider.todos[index]["isCompleted"] == true) ? Colors.grey.shade400 : Colors.black,
                          decoration:
                          (provider.todos[index]["isCompleted"] == true)
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(
                          provider.todos[index]["date"].toString()
                      ),
                      trailing:
                      (provider.todos[index]["isCompleted"] == true)
                          ? null
                          : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          provider.custombutton(context ,"Edit",index),
                            SizedBox(width: 20,),
                          provider.custombutton(context ,"Delete",index),


                      ],)
                  );
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Text("text",style: TextStyle(decoration: TextDecoration.lineThrough,decorationColor: Colors.red,decorationThickness: 3.0),),
            // ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            provider.add();
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
