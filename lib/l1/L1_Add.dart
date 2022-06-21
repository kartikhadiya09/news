
import 'package:flutter/material.dart';

import '../Clas/Realtime.dart';

class L1_Add extends StatefulWidget {
  const L1_Add({Key? key}) : super(key: key);

  @override
  State<L1_Add> createState() => _L1_AddState();
}

class _L1_AddState extends State<L1_Add> {
  TextEditingController titel = TextEditingController();
  TextEditingController body = TextEditingController();
  TextEditingController photo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Add News"),
          ),
          body: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        controller: titel,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tital',
                          hintText: 'Lebal',
                          suffixIcon: Icon(Icons.view_headline),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        maxLength: 200,
                        controller: body,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Body',
                          hintText: 'About',
                          suffixIcon: Icon(Icons.abc_outlined),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        maxLines: 1,
                        controller: photo,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Photo',
                          hintText: 'Link',
                          suffixIcon: Icon(Icons.photo),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(onPressed: (){
                      RealTime().addNews(titel.text, body.text, photo.text);
                    }, child: Text("ADD"))
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
