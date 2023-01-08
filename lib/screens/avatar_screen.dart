import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle avatar'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              child: const Text('CA'),
            ),
          )
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage(
              'https://www.elcarrocolombiano.com/wp-content/uploads/2020/10/20201031-MERCEDES-BENZ-GLE-450-COUPE-PRUEBA-DE-MANEJO-TEST-DRIVE-VIDEO-COLOMBIA-01.jpg'),
        ),
      ),
    );
  }
}
