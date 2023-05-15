import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon menu'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        children: [
          MenuChoice(
            image: AssetImage('assets/choice1.png'),
            title: 'Choix 1',
          ),
          MenuChoice(
            image: AssetImage('assets/choice2.jfif'),
            title: 'Choix 2',
          ),
          MenuChoice(
            image: AssetImage('assets/choice3.png'),
            title: 'Choix 3',
          ),
          MenuChoice(
            image: AssetImage('assets/choice4.png'),
            title: 'Choix 4',
          ),
        ],
      ),
    );
  }
}

class MenuChoice extends StatelessWidget {
  const MenuChoice({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final AssetImage image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Ajoutez ici le code à exécuter lorsque l'utilisateur appuie sur l'un des choix du menu
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: image,
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
