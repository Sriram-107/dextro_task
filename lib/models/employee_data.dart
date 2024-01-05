class Employee {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;

  Employee({this.id, this.employeeName, this.employeeAge, this.employeeSalary});

  factory Employee.fromJson(Map<String, dynamic> employee) {
    return Employee(
        id: employee['id'],
        employeeName: employee['employee_name'],
        employeeAge: employee['employee_age'],
        employeeSalary: employee['employee_salary']);
  }
}

class EmployeesData {
  String? status;
  List<Employee>? data;
  String? message;

  EmployeesData({this.status, this.data, this.message});

  factory EmployeesData.fromJson(Map<String, dynamic> json) {
    var parsed = json['data'] as List<dynamic>;
    return EmployeesData(
        status: json["status"],
        data: List<Employee>.from(parsed.map((i) => Employee.fromJson(i))),
        message: json["message"]);
  }
}
