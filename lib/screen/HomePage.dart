import 'package:flutter/material.dart';
import 'package:flutter_application_final/screen/HomePageDetail.dart';

class Todo {
  int id;
  String title;

  Todo({required this.id, required this.title});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = List.generate(
    20,
    (index) => Todo(id: index, title: "todo item ${index + 1}"), //전달 데이처
  );

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoList"),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TodoDetailScreen(
                      title: "todo item ${index + 1}",
                      date: '',
                    ); //<HomePageDetail>클래스로 이동
                  }),
                );
              },
              title: Text(list[index].title),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: _textEditingController,
                        )),
                        IconButton(
                            onPressed: () {
                              final text =
                                  _textEditingController.value.text.trim();
                              if (text.isEmpty) return;

                              setState(() {
                                list.add(Todo(id: list.length, title: text));
                              });
                              _textEditingController.clear();
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.send)),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
