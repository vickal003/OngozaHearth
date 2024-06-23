import 'package:flutter/material.dart';

class Conseil extends StatelessWidget {
  String message;
  Conseil({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OngozaHealth Plus'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        height: 500.0,
        width: 550.0,
        color: Colors.white70,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img.jpg',
              height: 70,
              width: 140,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Text(message,
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none)),
            Divider(thickness: 5),
            SizedBox(
              height: 10,
            ),
            Text(
                "Pour plus d'infos suivez-nous sur nos reseaux et visitez notre site web: www.ongoza-rdc.com Téléphone: +243995216651.",
                style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none)),
          ],
        )),
      ),
    );
  }
}
