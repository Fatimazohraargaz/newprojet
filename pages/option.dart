import 'package:flutter/material.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({super.key});

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  GlobalKey<ScaffoldState> Scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      // appBar: AppBar(),
      // drawer: Drawer(),
      body: Stack(children: [
        Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          margin: EdgeInsets.only(top: 100),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("ProfilePage");
                  },
                  child: Text(
                    "Menu",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 110, vertical: 15)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("ProfilePage");
                  },
                  child: Text(
                    "Transfert d'argents",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("ProfilePage");
                },
                child: Text(
                  "Code QR",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 90, vertical: 15)),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}