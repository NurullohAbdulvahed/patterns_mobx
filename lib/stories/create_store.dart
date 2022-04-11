import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_dart/models/post_model.dart';
import 'package:mobx_dart/services/http_service.dart';
import 'package:mobx_dart/services/log_service.dart';
part 'create_store.g.dart';
class CreateStore = _CreateStore with _$CreateStore;

abstract class _CreateStore with Store {
  @observable
  TextEditingController titleController = TextEditingController();
  @observable
  TextEditingController bodyController = TextEditingController();


  void apiCreatePost(BuildContext context) async{
    String title = titleController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    Post post =Post(title: title, body: body, userId: body.hashCode);

    var result = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    if(result != null){
      Navigator.pop(context,result);
    }
    else{
      Log.e("Something went wrong");
    }
    //Log.d(result!);
  }
}