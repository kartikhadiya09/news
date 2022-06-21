
import 'package:calculater/Clas/Auth.dart';
import 'package:flutter/material.dart';


class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      color: Colors.amber,
                      child: Image.network(
                        "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTehPFB9m6NbB8vPIuyXUWN7F9A0ryhn23PJZ5MpRBzaMCGtGy3",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 69,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 15, left: 55, right: 55),
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
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            child: Text("Alredy have account?"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context, );
                            },
                            child: Container(
                              height: 50,
                              child: Text(
                                "  Singn In",
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
                      Auth a1 = Auth();
                      a1.Singup(username_controller.text,
                        password_controller.text,);

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
