import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/TodoProvider.dart';

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
       ChangeNotifierProvider(create: (context)=>TodoProvider()),
      ],
      child: MaterialApp(

        title: 'Flutter Demo',
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    return Consumer<TodoProvider>(
      builder: (context,provider,child) {

      return  Scaffold(
          appBar: AppBar(
           title: Text("Todo app"),
           backgroundColor: Colors.blue,
          ),
          body:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                    controller: provider.todoTextField,
                    decoration: InputDecoration(
                      hintText: 'Enter your todo...',
                      border: OutlineInputBorder(),
                    ),
                  ),
              ),

          Expanded(
            child: ListView.builder(
              itemCount: provider.final_result.length,
                itemBuilder: (context,index){
              return ListTile(
            title: Text(provider.final_result[index].toString()),
                    trailing:IconButton( icon :Icon(Icons.remove),
                    onPressed: (){
            provider.remove(index);
                    },
                    ),
              );
                  },
                  ),
          ),

        ],
          ),
        floatingActionButton:FloatingActionButton(
          onPressed: (){
            provider.add();

          },
          child: Icon(Icons.add),
        ),
      );
      }
    );

  }
}
