import 'package:employee_app/main_screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  int _selectedAge = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        shadowColor: Theme.of(context).appBarTheme.shadowColor,
        title: const Text(
          "Age Screen",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Select age",
              style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      borderRadius: BorderRadius.circular(25),
                      dropdownColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                      value: _selectedAge,
                      hint: const SizedBox(
                        width: 100,
                        child: Text(
                          "age!!",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedAge = value;
                        });
                      },
                      items: ages
                          .map<DropdownMenuItem>((age) => DropdownMenuItem(
                                value: age,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 35.0),
                                    child: Text(
                                      'Below $age',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ))
                          .toList()),
                ),
              ),
            ),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      age: _selectedAge,
                    ),
                  ),
                );
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
