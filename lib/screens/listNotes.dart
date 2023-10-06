import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:ownnotess/models/notesmodel.dart';
import 'package:ownnotess/main.dart';
import '../controllers/readdata.dart';

class ReadNotes extends StatefulWidget {


  @override
  State<ReadNotes> createState() => _ReadNotesState();
}

class _ReadNotesState extends State<ReadNotes> {
  bool isLoading=true;
  var futurereaddata;
  List<String> list=[];
  @override
  void initState(){
    super.initState();
    futurereaddata=readData();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('NoteList'),
          ),
          body: isLoading?CircularProgressIndicator():ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                height: 50,
                child: Center(
              child: Text(list[index],
      style: TextStyle(color: Colors.brown),),

      ),
                );
      }
      ));

    }
    Future<void> readData() async{
      var url="https://ownnotes-7c489-default-rtdb.firebaseio.com/"+"data.json";
      final response=await http.get(Uri.parse(url));
      final futurereaddata=json.decode(response.body) as Map<String, dynamic>;
      if(futurereaddata == null){
        return ;
      }
      futurereaddata.forEach((id, data) {
        list.add(data["body"]);
        list.add(data["title"]);
      });
        setState(() {
          isLoading =false;
        });
    }
  }



    // decoration: BoxDecoration(
    // color: bg,
    // shape: BoxShape.rectangle,
    // borderRadius: BorderRadius.circular(10),
    // ),
    // Container(
    // contentPadding: EdgeInsets.only(
    // top: 5,
    // right: 8,
    // left: 8,
    // bottom: 0,
    // ),
    // title: Padding(
    // padding: EdgeInsets.symmetric(
    // vertical: 8,
    // ),
    // child: Text(
    // noteController.notes[index].title,
    // maxLines: 1,
    // overflow: TextOverflow.ellipsis,
    // style: TextStyle(
    // color: Colors.black,
    // fontSize: 18,
    // fontWeight: FontWeight.w500,
    // ),
    // ),
    // ),
    // subtitle: Text(
    // noteController.notes[index].body,
    // maxLines: 10,
    // overflow: TextOverflow.ellipsis,
    // style: TextStyle(
    // fontSize: 14,
    // color: Colors.black,
    // ),
    // ),
    // ),
    // Row(
    // mainAxisAlignment: MainAxisAlignment.end,
    // children: [
    // Text(
    // formattedDate,
    // style: TextStyle(
    // color: Colors.black,
    // ),
    // ),
    // ],
    // ),
    // ],
    // ),
    // ),
    //
    // ));
    // ],
    // )
    // ,

