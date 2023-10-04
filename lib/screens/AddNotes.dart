import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_icon_btn.dart';
import 'package:http/http.dart' as http;




class AddNotePage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  var bodyvalue;
  var titlevalue;

  AddNotePage({Key? key}) : super(key: key);
  void writeDate() async{
    var url="https://ownnotes-7c489-default-rtdb.firebaseio.com/Notes"+"data.json";
    try
    {
      final response=await http.post(
          Uri.parse(url),
          body: json.encode({"title":titleController.text,"body":bodyController.text}),
      );
    }catch(error){
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var bodyvalue;
    var titlevalue;
    return Scaffold(
      appBar: AppBar(),
      body:
      SafeArea(
        child: Container(
          height: size.height,
          padding: EdgeInsets.all(
            16.0,
          ),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CustomIconBtn(
                //   color: Theme.of(context).colorScheme.background,
                //   onPressed: () {
                //     // Navigator.pushReplacementNamed(context, '/home');
                //   },
                //   icon: Icon(
                //     Icons.arrow_back_ios_outlined,
                //   ),
                // ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                ),
                Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter some text';
                        }
                        return null;
                      },
                      maxLines: null,
                      autofocus: true,
                      controller: titleController,
                      keyboardType: TextInputType.multiline,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration.collapsed(
                        hintText: "Title",
                      ),
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'please enter some text';
                        }
                        return null;
                      },
                      controller: bodyController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration.collapsed(
                        hintText: "Type something...",
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (titleController.text.length == 0 &&
              bodyController.text.length == 0) {
            showEmptyTitleDialog(context);
          } else {
            bodyvalue=bodyController.text;
            titlevalue=titleController.text;
            print(bodyvalue);
            print(titlevalue);
            writeDate();
            // // Database().addNote(authController.user.uid, titleController.text,
            //     bodyController.text);
            Navigator.of(context).pop();
          }
        },
        label: Text("Save"),
        icon: Icon(Icons.save),
      ),
    );
  }
}
void showEmptyTitleDialog(BuildContext context) {
  print("in dialog ");
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        title: Text(
          "Notes is empty!",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
        content: Text(
          'The content of the note cannot be empty to be saved.',
          style: Theme
              .of(context)
              .textTheme
              .titleMedium,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Okay",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


//
// class AddNotePage extends StatefulWidget {
//   const AddNotePage({Key? key}):super(key: key);
//
//   @override
//   State<AddNotePage> createState() => _AddNotePageState();
// }
//
// class _AddNotePageState extends State<AddNotePage> {
//
//   final TextEditingController titleController = TextEditingController();
//     final TextEditingController bodyController = TextEditingController();
//
//     @override
//     Widget build(BuildContext context) {
//       final Size size = MediaQuery.of(context).size;
//       return Scaffold(
//         appBar: AppBar(),
//         body: SafeArea(
//           child: Container(
//             height: size.height,
//             padding: EdgeInsets.all(
//               16.0,
//             ),
//             child: Column(children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   CustomIconBtn(
//                     color: Theme.of(context).colorScheme.background,
//                     onPressed: () {
//                       // Get.back();
//                     },
//                     icon: Icon(
//                       Icons.arrow_back_ios_outlined,
//                     ),
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width / 4,
//                   ),
//                   Text(
//                     "Notes",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         maxLines: null,
//                         autofocus: true,
//                         controller: titleController,
//                         keyboardType: TextInputType.multiline,
//                         textCapitalization: TextCapitalization.sentences,
//                         decoration: InputDecoration.collapsed(
//                           hintText: "Title",
//                         ),
//                         style: TextStyle(
//                           fontSize: 26.0,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       TextFormField(
//                         controller: bodyController,
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                         textCapitalization: TextCapitalization.sentences,
//                         decoration: InputDecoration.collapsed(
//                           hintText: "Type something...",
//                         ),
//                         style: TextStyle(
//                           fontSize: 20.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ]),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: () {
//             if (titleController.text.length == 0 &&
//                 bodyController.text.length == 0) {
//               showEmptyTitleDialog(context);
//             } else {
//               // // Database().addNote(authController.user.uid, titleController.text,
//               //     bodyController.text);
//               // Get.back();
//             }
//           },
//           label: Text("Save"),
//           icon: Icon(Icons.save),
//         ),
//       );
//
//       return const Placeholder();
//     }
//   }
//   void showEmptyTitleDialog(BuildContext context) {
//     print("in dialog ");
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Theme
//               .of(context)
//               .colorScheme
//               .background,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10.0),
//             ),
//           ),
//           title: Text(
//             "Notes is empty!",
//             style: Theme
//                 .of(context)
//                 .textTheme
//                 .titleLarge,
//           ),
//           content: Text(
//             'The content of the note cannot be empty to be saved.',
//             style: Theme
//                 .of(context)
//                 .textTheme
//                 .titleMedium,
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text(
//                 "Okay",
//                 style: Theme
//                     .of(context)
//                     .textTheme
//                     .titleMedium,
//               ),
//               onPressed: () {
//                 // Get.back();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
