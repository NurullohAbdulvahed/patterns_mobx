import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_dart/mobx_home/stories/home_store.dart';
import 'package:mobx_dart/mobx_home/view/item_of_post.dart';


class HomePage extends StatefulWidget {
  static String id = "";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore store = HomeStore();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Set State"),
        ),
        body: Observer(
          builder: (_) => Stack(
            children: [
              ListView.builder(
                itemCount: store.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(store,store.items[index],);
                },
              ),
              store.isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            store.goToCreatePage(context);
          },
          child: const Icon(Icons.add),
        ));
  }


}
