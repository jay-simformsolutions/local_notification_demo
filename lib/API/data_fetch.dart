
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_push_notification_demo/model/employee_model.dart';

class DataFetch{
  Future<List<EmployeeModel>> getEmployeeData() async{
    List<EmployeeModel> data = [];
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if(response.statusCode == 200){
        final jsonData = jsonDecode(response.body);
        debugPrint('JsonData is $jsonData');
         data = jsonData.map<EmployeeModel>((employee) => EmployeeModel.fromJson(employee)).toList();
         debugPrint('Data is $data');
      }
    }catch(e,s){
      debugPrintStack(stackTrace: s);
    }
    return data;
  }
}