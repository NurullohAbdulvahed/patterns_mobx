import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_dart/mobx_home/models/post_model.dart';
import 'package:mobx_dart/mobx_home/services/http_service.dart';
import 'package:mobx_dart/mobx_home/services/log_service.dart';

part 'edit_store.g.dart';

class EditStore = _EditStore with _$EditStore;

abstract class _EditStore with Store{
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  Post? newPost;

   void editPost(Post post) {
     newPost = post;
     titleController.text = newPost?.title ?? "No Data";
     bodyController.text = newPost?.body ?? "No Data";
   }

  void apiEditData(BuildContext context) async{
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    if(newPost!= null){
      Post post = Post(id: newPost!.id, title: title, body: body, userId: body.length);
      String? result = await Network.PUT(Network.API_UPDATE + newPost!.id.toString(), Network.paramsUpdate(post));
      if(result != null) {
        Navigator.pop(context, result);

      } else {
        Log.e("Error");
      }

    }
  }
}
