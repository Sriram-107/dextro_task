import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/employee_data.dart';

class EmployeeDetails {
  static Future<EmployeesData?> getEmployeeData() async {
    try {
      var response = await http
          .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return EmployeesData.fromJson(json);
      }
    } catch (exception) {
      throw EmployeeDetailsException().error();
    }
    return null;
  }
}

class EmployeeDetailsException implements Exception {
  String error() => 'Employee API failed';
}
