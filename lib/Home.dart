import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final list = <String>[];
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Single List',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        itemCount: list.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              height: 70,
              child: Card(
                elevation: 4,
                child: TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Value',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          list.add(inputController.text);
                          inputController.clear();
                        });
                      },
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              height: 70,
              child: Card(
                elevation: 5,
                child: ListTile(
                  title: Text(list[index - 1]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        list.removeAt(index - 1);
                      });
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
