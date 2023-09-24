// import 'package:bmi_calc/Ui_Part/first_page_name.dart';
import 'package:flutter/material.dart';
// import 'package:bmi_calc/Ui_Part/first_page_name.dart';

class UIApp extends StatefulWidget {
  var txt;
  UIApp({this.txt, super.key});

  @override
  State<UIApp> createState() => UIAppState();
}

class UIAppState extends State<UIApp> {
  /// global keys for validations
  final GlobalKey<FormState> wtKey = GlobalKey<FormState>();
  final GlobalKey<FormState> ftkey = GlobalKey<FormState>();

  var wtController = TextEditingController();
  var ftController = TextEditingController();

  var result = '';
  var bgColor = Colors.cyan;
  var mesg = '';

  /// strin name is for pass data and calling costructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello, ${widget.txt.toString()}',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Form(
                        key: wtKey,
                        child: TextFormField(
                          controller: wtController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field is Required';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text('Enter Your Weight (KG)'),
                              labelStyle: TextStyle(color: Colors.black87),
                              prefixIcon: Icon(Icons.line_weight),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero,
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero,
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 198, 14, 198),
                                    width: 2,
                                  ))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: ftkey,
                        child: TextFormField(
                          controller: ftController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field is Required';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              label: Text('Enter Your Height (Foot)'),
                              labelStyle: TextStyle(color: Colors.black87),
                              prefixIcon: Icon(Icons.height),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero,
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.zero,
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 198, 14, 198),
                                    width: 2,
                                  ))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          color: Colors.white38,
                        ),
                        child: TextButton(
                            onPressed: () {
                              validator();

                              var wtCalc = wtController.text.toString();
                              var ftCalc = ftController.text.toString();

                              var intWt = double.parse(wtCalc);
                              var intFt = double.parse(ftCalc);

                              var totalInches = (intFt * 12);

                              var totalCm = totalInches * 2.54;
                              var totalMeter = totalCm / 100;
                              var bmi = intWt / (totalMeter * totalMeter);

                              if (bmi > 25) {
                                mesg = "You're are Over Weight!!! ";
                                bgColor = Colors.red;
                              } else if (bmi < 18) {
                                mesg = "You're Under Weight!!!";
                                bgColor = Colors.pink;
                              } else {
                                mesg = "You're Healthy!!!";
                                bgColor = Colors.green;
                              }

                              setState(() {
                                result =
                                    "$mesg \n\n You're BMI is ${bmi.toStringAsFixed(3)}";
                              });
                            },
                            child: const Text(
                              'Calculate',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        result,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validator() {
    if (wtKey.currentState!.validate() && ftkey.currentState!.validate()) {}
  }
}
