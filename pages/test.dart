import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var text = "hello world!!!!";
  GlobalKey<ScaffoldState> Scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      // appBar: AppBar(),
      // drawer: Drawer(),
      body: Stack(children: [
        Container(
          color: Colors.orange,
          height: double.infinity,
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 90),
            child: Text(
              textAlign: TextAlign.center,
              "Bienvenue!",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          margin: EdgeInsets.only(top: 250),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    "vous pouvez choisir votre statut maintenant !",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.black),
                  )),
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("LoginPage");
                  },
                  child: Text(
                    "Client",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 110, vertical: 12)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 25),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("LoginPage");
                  },
                  child: Text(
                    "Employé",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 12)),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("LoginPage");
                },
                child: Text(
                  "Comptable",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 90, vertical: 12)),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}