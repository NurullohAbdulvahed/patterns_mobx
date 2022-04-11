import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_dart/mobx_home/models/post_model.dart';
import 'package:mobx_dart/mobx_home/pages/create_page.dart';
import 'package:mobx_dart/mobx_home/pages/edit_page.dart';
import 'package:mobx_dart/mobx_home/services/http_service.dart';
import 'package:mobx_dart/mobx_home/services/log_service.dart';
part 'home_store.g.dart';
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{
  @observable
  bool isLoading = false;
  @observable
  List<Post> items = [];


  void apiPostList() {
    isLoading = true;
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      // Log.d(response!),
      _showResponse(response!),
    });
  }

  void _showResponse(String response) {
    List<Post> list = Network.parsePostList(response);
    items.clear();
    isLoading = false;
    items = list;

  }

  void apiPostDelete(Post post) async {
    isLoading = true;
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      items.remove(post);
    }
    isLoading = false;
  }

  void goToCreatePage(BuildContext context) async{
    String result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreatePage()));
    Log.d(result);
    items.add(Network.parsePost(result));

  }


  void goToEditPage(Post post,BuildContext context) async{
    String result =await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditPage(post: post,)));
    Post newPost = Network.parsePost(result);
    items[items.indexWhere((element) => element.id == newPost.id)] = newPost;
  }
}