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

import '../controllers/readdata.dart';

class FetchNotes extends StatefulWidget {
  const FetchNotes({Key? key}) : super(key: key);

  @override
  State<FetchNotes> createState() => _FetchNotes State();
}

class _FetchNotes State extends State<FetchNotes> {
  Query dbref = FirebaseDatabase.instance.ref().child('data');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('data');
  @override
  Widget listItem({required Map data}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.amberAccent,
      child:  const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['body'],
            style:TextStyle(fontSize: 16, fontWeight: FontWeight.w400),,
          )
        ],
      ),
    );
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('NoteList'),
          ),
          body: Container(
            child: FirebaseAnimatedList(
                query: dbref,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                  Map data=snapshot.value as Map;
                  data['key']=snapshot.key;

                  return listItem(data: data);
                }
            ),

          )
      );
    }

  }
}


class NoteList extends StatelessWidget {
Query dbref = FirebaseDatabase.instance.ref().child('data');
DatabaseReference reference = FirebaseDatabase.instance.ref().child('data');
  var extractedData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoteList'),
      ),
      body: Container(
              child: FirebaseAnimatedList(
                query: dbref,
                itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index){
                  Map data=snapshot.value as Map;
                  data['key']=snapshot.key;

                  return listItem(data: data);
                }
              ),

      )
    );

  }
  readData() async{
    var datas;
    var url="https://ownnotes-7c489-default-rtdb.firebaseio.com/"+"data.json";
    try
    {
      final response=await http.get(Uri.parse(url));
      extractedData= jsonDecode(response.body)as Map<String, dynamic>;
      extractedData=datas;
      if(extractedData == null){
        return ;
      }
      print(extractedData);

    }catch(error){
      throw error;
    }

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

