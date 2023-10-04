import 'dart:convert';

import 'package:http/http.dart' as http;

readData() async{
  var url="https://ownnotes-7c489-default-rtdb.firebaseio.com/"+"data.json";
  try
  {
    final response=await http.get(Uri.parse(url));
      final extractedData= jsonDecode(response.body)as Map<String, dynamic>;
      if(extractedData == null){
        return ;
      }
      print(extractedData);

  }catch(error){
    throw error;
  }

}