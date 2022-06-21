import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../Clas/Modal.dart';
import '../Clas/Realtime.dart';

class L1_Home extends StatefulWidget {
  const L1_Home({Key? key}) : super(key: key);

  @override
  State<L1_Home> createState() => _L1_HomeState();
}

class _L1_HomeState extends State<L1_Home> {
  List<FireModal> l1 = [];
  TextEditingController Dtitel = TextEditingController();
  TextEditingController Dbody = TextEditingController();
  TextEditingController Dphoto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: StreamBuilder(
          stream: RealTime().redDAta(),
          builder: (context, AsyncSnapshot snapshot) {
            l1.clear();
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              DataSnapshot snap = snapshot.data.snapshot;

              for (DataSnapshot sp in snap.children) {
                String photo = sp.child("photo").value.toString();
                String body = sp.child("body").value.toString();
                String title = sp.child("title").value.toString();
                String? key = sp.key;
                FireModal fireModal = FireModal(photo, title, body, key!);
                l1.add(fireModal);
              }
              return ListView.builder(
                  itemCount: l1.length,
                  itemBuilder: (context, indext) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        child: Container(
                          height: 400,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Card(
                                color: Colors.blue,
                                child: Container(
                                  height: 50,

                                  width: 400,
                                  //MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${l1[indext].title}",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  width: 250,
                                  child: Image.network(
                                    "${l1[indext].photo}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 125,
                                width: 350,
                                alignment: Alignment.center,
                                //width: MediaQuery.of(context).size.width,
                                child: Text("${l1[indext].body}"),
                              ),
                              Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                        color: Colors.green,
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              Dtitel.text =
                                                  l1[indext].title;
                                              Dbody.text =
                                                  l1[indext].body;
                                              Dphoto.text =
                                                  l1[indext].photo;
                                            });
                                            updateDialog(l1[indext].key);
                                          },
                                          child: Icon(
                                            Icons.update,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        )),
                                    Card(
                                        color: Colors.red,
                                        child: TextButton(
                                          onPressed: () {
                                            Delit(l1[indext].key);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });

            }
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          },
        ),

        /* StreamBuilder(
          stream: RealTime().redDAta(),
          builder: (context, AsyncSnapshot snapshot) {
            l1.clear();
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              DataSnapshot snap = snapshot.data.snapshot;

              for (DataSnapshot sp in snap.children) {
                String photo = sp.child("photo").value.toString();
                String body = sp.child("body").value.toString();
                String title = sp.child("title").value.toString();
                String? key = sp.key;

                FireModal fireModal = FireModal(photo, title, body,key!);
                l1.add(fireModal);
              }
              return ListView.builder(
                  itemCount: l1.length,
                  itemBuilder: (context, indext) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        child: Container(
                          height: 400,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Card(
                                color: Colors.blue,
                                child: Container(
                                  height: 50,

                                  width: 400,
                                  //MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${l1[indext].title}",
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 150,
                                  width: 250,
                                  child: Image.network(
                                    "${l1[indext].photo}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 125,
                                width: 350,
                                alignment: Alignment.center,
                                //width: MediaQuery.of(context).size.width,
                                child: Text("${l1[indext].body}"),
                              ),
                              Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                        color: Colors.green,
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              Dtitel.text=l1[indext].title;
                                              Dbody.text=l1[indext].body;
                                              Dphoto.text=l1[indext].photo;
                                            });
                                            updateDialog(l1[indext].key);
                                          },
                                          child: Icon(
                                            Icons.update,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        )),
                                    Card(
                                        color: Colors.red,
                                        child: TextButton(
                                          onPressed: () {
                                            Delit(l1[indext].key);
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        )),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          },
        ),*/
      ),
    );
  }

  void updateDialog(String key) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: TextField(
                            controller: Dtitel,
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
                            maxLines: 4,
                            controller: Dbody,
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
                            controller: Dphoto,
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
                        ElevatedButton(
                            onPressed: () {
                              RealTime().updateData(
                                  Dtitel.text, Dbody.text, Dphoto.text, key);
                              Navigator.pop(context);
                            },
                            child: Text("Update"))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  void Delit(String key) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "ALEART",
              style: TextStyle(color: Colors.red),
            ),
            actions: [
              Container(
                child: Column(
                  children: [
                    Center(child: Text("ARE  YOU  SURE ?")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              // RealTime().deliteNews(key);
                              Navigator.pop(context);
                            },
                            child: Text("NO"),
                            style: TextButton.styleFrom(primary: Colors.green),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              RealTime().deliteNews(key);
                              Navigator.pop(context);
                            },
                            child: Text("YAS"),
                            style: TextButton.styleFrom(primary: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
