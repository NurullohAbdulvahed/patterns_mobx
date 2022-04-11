import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_dart/stories/create_store.dart';
import 'package:mobx_dart/view/item_of_textField.dart';




class CreatePage extends StatefulWidget {
  static String id = "CreatePage";
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateStore store = CreateStore();


  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) =>  Scaffold(
          appBar: AppBar(
            title: const Text("Create Post"),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: (){
                  store.apiCreatePost(context);
                },
                icon: const Icon(Icons.save),
              ),
            ],
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                textField(store.titleController,"Title"),
                textField(store.bodyController,"Body"),
              ],
            ),
          ),
        ),
    );

  }
}
