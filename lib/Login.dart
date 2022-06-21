
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'Clas/Auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.amber,
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWxYyxKyr9u9qKLwMnSsUi35bU9Zsd2dYazg&usqp=CAU",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 70,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 20, left: 55, right: 55),
                    color: Colors.white,
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT_drmwbgheUwQBSs-W7L1FxNcqhhlW_xY7eM7s3z0dsWUU6thXkC8mRlaH2k55RJH_g&usqp=CAU",
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                     Auth().Google(context);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          //color: Colors.blue,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPk8LCyciAEO1xe9r6k8ytnbjm65WDCp9Dag&usqp=CAU",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 5, right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            child: Text("Create A New Account?"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'Create');
                            },
                            child: Container(
                              height: 50,
                              child: Text(
                                "  Singn Up",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 420,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      controller: username_controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ID',
                        hintText: 'Email',
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      controller: password_controller,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Password',
                        hintMaxLines: 1,
                        suffixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Auth a2 = Auth();
                      a2.login(username_controller.text,
                          password_controller.text, context);
                    },
                    child: Text('            Sign in           '),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
