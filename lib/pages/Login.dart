import 'package:flutter/material.dart';
import 'package:foodmonkey_project/helper/TrianglePainter.dart';
import 'package:foodmonkey_project/pages/Register.dart';
import 'package:foodmonkey_project/utils/Api.dart';
import 'package:foodmonkey_project/utils/Constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Stack(children: [
        CustomPaint(
          painter: TrianglePainter(mSize),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset('assets/images/fm.png'),
              Text(
                'Login',
                style: TextStyle(fontSize: 40),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Constants.normal),
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
                          labelStyle:
                              TextStyle(fontSize: 20, color: Constants.normal),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                    },
                    child: Text('Not a member yet!\n Register here',style: TextStyle(color: Colors.blue[400]),)),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Constants.secondary)),
                    onPressed: ()async {
              
                       var phone = phoneController.text;
                       var password = passwordController.text;
                       bool bol = await Api.loginUser(phone: phone,password: password);
                    
                    if(bol) {
                      Navigator.pop(context);
                    } else {
                      print('login fail');
                    }
                    },
                    icon: Icon(
                      Icons.login,
                    ), // Replace Icons.add with your desired icon
                    label: Text(
                      'Login',
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
