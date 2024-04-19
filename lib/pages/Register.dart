import 'package:flutter/material.dart';
import 'package:foodmonkey_project/helper/TrianglePainter.dart';
import 'package:foodmonkey_project/utils/Api.dart';
import 'package:foodmonkey_project/utils/Constants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        child: Stack(children: [
          CustomPaint(
            painter: TrianglePainter(mSize),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset('assets/images/fm.png'),
                Text(
                  'Register',
                  style: TextStyle(fontSize: 40),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                fontSize: 20, color: Constants.normal),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.normal),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: 'Phone',
                            labelStyle: TextStyle(
                                fontSize: 20, color: Constants.normal),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.normal),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.normal),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontSize: 20, color: Constants.normal),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.normal),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.normal),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constants.secondary)),
                      onPressed: () async {
                        var name = nameController.text;
                        var phone = phoneController.text;
                        var password = passwordController.text;
                        bool bol = await Api.registerUser(
                            name: name, phone: phone, password: password);

                        if (bol) {
                          Navigator.pop(context);
                        } else {
                          print('Registration fail');
                        }
                      },
                      icon: Icon(
                        Icons.person_pin,
                      ), // Replace Icons.add with your desired icon
                      label: Text(
                        'Register',
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
