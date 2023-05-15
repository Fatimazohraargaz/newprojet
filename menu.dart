import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Menu'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
        ],
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {},
        child: Icon(Icons.shopping_cart),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: constraints.maxHeight),
              child: MoviesInformation(),
            ),
          );
        },
      ),
    );
  }
}

class MoviesInformation extends StatefulWidget {
  const MoviesInformation({Key? key}) : super(key: key);
  @override
  _MoviesInformationState createState() => _MoviesInformationState();
}

class _MoviesInformationState extends State<MoviesInformation> {
  final Stream<QuerySnapshot> _moviesStream =
      FirebaseFirestore.instance.collection('plats').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _moviesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> movie =
                document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Image.network(movie['poster']),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(children: [
                      Text(
                        movie['name'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      //const Text("Prix :"),
                      Text(movie['price'].toString()),
                    ]),
                  )
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
