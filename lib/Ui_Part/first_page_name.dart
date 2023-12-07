import 'package:bmi_calc/Ui_Part/ui_app.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NameUser extends StatelessWidget {
  NameUser({super.key});

  var nameController = TextEditingController();
  final GlobalKey<FormState> nameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(212, 143, 80, 177),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Text(
                  'Welcome To BMI Calculator',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.orange),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                children: [
                  Form(
                    key: nameKey,
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This Field is Required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                          label: Text("Enter You're Name'"),
                          labelStyle: TextStyle(color: Colors.black87),
                          prefixIcon: Icon(Icons.text_format),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: Colors.amber,
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (nameKey.currentState!.validate()) {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return UIApp(
                                txt: nameController.text.toString(),
                              );
                            },
                          ));
                        }
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
