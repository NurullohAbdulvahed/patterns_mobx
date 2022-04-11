import 'package:flutter/material.dart';
import 'package:mobx_dart/stories/edit_store.dart';
import '../models/post_model.dart';

//ignore: must_be_immutable
class EditPage extends StatefulWidget {
  static String id ="EditPage";
  Post? post;
   EditPage({Key? key, required this.post}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
EditStore store = EditStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   store.editPost(widget.post!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Post"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              store.apiEditData(context);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              maxLines: 3,
              controller: store.titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
            ),
            TextField(
              maxLines: 10,
              controller: store.bodyController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Body",
              ),
            ),
          ],
        ),
      ),
    );

  }
}
