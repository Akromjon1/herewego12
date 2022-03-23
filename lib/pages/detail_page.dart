import 'package:flutter/material.dart';
import 'package:herewego/model/post_model.dart';
import 'package:herewego/services/RTDB_service.dart';
import 'package:herewego/services/pref_services.dart';
class DetailPage extends StatefulWidget {
static const String id = 'detail_page';
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var titleController = TextEditingController();
  var contentController = TextEditingController();

  _addPost() async{
    String title  = titleController.text.toString();
    String content = contentController.text.toString();
    if(title.isNotEmpty || content.isEmpty) return;
    _apiAddPost(title, content);
  }
  _apiAddPost(String title, String content) async{
    var id = await Prefs.loadUserId();
    RTDBService.addPost(Post(id, title, content)).then((response)=>{
      _respAddPost(),
    }
    );
  }
  _respAddPost(){
    Navigator.of(context).pop({'data':'done'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: Text("Add Post"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SizedBox(height: 15,),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                  hintText: "Content",
                ),
              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                height: 45,
                child: FlatButton(
                  onPressed: _addPost,
                  color: Colors.deepOrange,
                  child: Text(
                    "Add",style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
