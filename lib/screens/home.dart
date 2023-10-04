import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:ownnotess/screens/setting.dart';

import '../widgets/custom_icon_btn.dart';
import 'AddNotes.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      }, icon: const Icon(Icons.keyboard_backspace)),
                      // CustomIconBtn(
                      //   color: Theme.of(context).colorScheme.background,
                      //   onPressed: () {
                      //
                      //   },
                      //   icon: const Icon(null),
                      //   // icon: Icon(authController.axisCount.value == 2
                      //   // ? Icons.list
                      //   //     : Icons.grid_on),
                      // ),
                      const Text(
                        "Notes",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(onPressed: (){
                        // Navigator.pop(context);
                        Navigator.pushNamed(context, '/NoteList');
                      }, icon: const Icon(Icons.settings)),
                      // CustomIconBtn(
                      //   color: Theme.of(context).colorScheme.background,
                      //   // onPressed: () {
                      //   //   // Navigator.pushReplacementNamed(context, '/Setting');
                      //   // },
                      //   icon: const Icon(
                      //     Icons.settings,
                      //
                      //   ), onPressed: (){
                      //     Navigator.pushReplacementNamed(context, '/Setting');
                      // },
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // GetX<NoteController>(
                  // init: Get.put<NoteController>(NoteController()),
                  // builder: (NoteController noteController) {
                  // if (noteController != null &&
                  // noteController.notes != null) {
                  // return NoteList();
                  // } else {
                  // return Text("No notes, create some ");
                  // }
                  // }),
                ],
              ))),
      floatingActionButton: FloatingActionButton(
          tooltip: "Add Note",
          onPressed: () {
            Navigator.pushNamed(context, '/AddNotePage');
          },
          child: const Icon(
            Icons.add_rounded,
            size: 30,
          )),
    );
  }
}



// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//           child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 10,
//                 horizontal: 16,
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomIconBtn(
//                         color: Theme.of(context).colorScheme.background,
//                         onPressed: () {
//                           // authController.axisCount.value =
//                           // authController.axisCount.value == 2 ? 4 : 2;
//                         },
//                         icon: const Icon(null),
//                         // icon: Icon(authController.axisCount.value == 2
//                         // ? Icons.list
//                         //     : Icons.grid_on),
//                       ),
//                       const Text(
//                         "Notes",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       CustomIconBtn(
//                         color: Theme.of(context).colorScheme.background,
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/Setting');
//                         },
//                         icon: const Icon(
//                           Icons.settings,
//
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   // GetX<NoteController>(
//                   // init: Get.put<NoteController>(NoteController()),
//                   // builder: (NoteController noteController) {
//                   // if (noteController != null &&
//                   // noteController.notes != null) {
//                   // return NoteList();
//                   // } else {
//                   // return Text("No notes, create some ");
//                   // }
//                   // }),
//                 ],
//               ))),
//       floatingActionButton: FloatingActionButton(
//           tooltip: "Add Note",
//           onPressed: () {
//             Navigator.pushNamed(context, '/AddNotePage');
//           },
//           child: const Icon(
//             Icons.note_add,
//             size: 30,
//           )),
//     );
//   }
// }
//
