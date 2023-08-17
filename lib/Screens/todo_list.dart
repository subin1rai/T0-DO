import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo/Screens/add_page.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        centerTitle: true,
      ),
      floatingActionButton:
          FloatingActionButton.extended(onPressed: navigateToAddPage,
           label: const Text("Add")),
    );
  }

  //navigate to another page
  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddToDoPage(),
    );
    Navigator.push(context, route);
  }

  //api get all
  Future <void> fetchTodo()async{
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.statusCode);
    print(response.body);

  }
}
