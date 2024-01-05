import 'package:employee_app/services/get_employee_details.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/constants.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  int age;
  HomeScreen({super.key, required this.age});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        shadowColor: Theme.of(context).appBarTheme.shadowColor,
        title: const Text(
          "Home Page",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<int>(
                icon: const Icon(
                  Icons.filter_alt,
                  color: Colors.white,
                ),
                onSelected: (int value) {
                  setState(() {
                    widget.age = value;
                  });
                },
                itemBuilder: (context) {
                  return ages
                      .map(
                        (age) => PopupMenuItem(
                          value: age,
                          child: Text(' Below   $age'),
                        ),
                      )
                      .toList();
                }),
          )
        ],
      ),
      body: FutureBuilder(
          future: EmployeeDetails.getEmployeeData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Shimmer.fromColors(
                  baseColor: Colors.black45,
                  highlightColor: Colors.grey[600]!,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(
                            255,
                            216,
                            205,
                            205,
                          ),
                        ),
                      ),
                      title: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(
                            255,
                            216,
                            205,
                            205,
                          ),
                        ),
                      ),
                      trailing: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(
                            255,
                            216,
                            205,
                            205,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
                child: ListView(
                  children: [
                    ...snapshot.data!.data!
                        .where((employee) => employee.employeeAge! < widget.age)
                        .map((employee) => Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.amber,
                                      child: Text(
                                        employee.id.toString(),
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),
                                    title: Text(
                                      employee.employeeName!,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    trailing: Text(
                                      'Age : ${employee.employeeAge}',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const Divider(
                                  thickness: 0.2,
                                  color: Colors.white,
                                )
                              ],
                            ))
                        .toList()
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "Error!! \n\n API call failed!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 1.2,
                      color: Colors.white),
                ),
              );
            }

            // return Material();
          }),
      // body: Center(
      //   child: Text(
      //     widget.age.toString(),
      //   ),
      // ),
    );
  }
}
