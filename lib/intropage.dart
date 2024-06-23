import 'package:flutter/material.dart';
import 'package:health/masse.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Intropage extends StatefulWidget {
  const Intropage({Key? key}) : super(key: key);

  @override
  State<Intropage> createState() => _IntropagePageState();
}

class _IntropagePageState extends State<Intropage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white70,
          scrollPhysics: BouncingScrollPhysics(),
          pages: [
            PageViewModel(
                titleWidget: const Text(
                  "Welcome to OngozaHealth App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                body:
                    "L'application qui vous permet de calculer notre Indice de Masse Corporelle (IMC). Let's go",
                image: Image.asset(
                  "assets/IMG_20230331_191329.jpg",
                  height: 400,
                  width: 400,
                )),
            PageViewModel(
                titleWidget: const Text(
                  "OngozaHealth App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                body:
                    "L’indice de masse corporelle (IMC) permet d’évaluer rapidement votre corpulence simplement avec votre poids et votre taille, quel que soit votre sexe. Calculez rapidement votre IMC et découvrez dans quelle catégorie vous vous situez. ",
                image: Image.asset(
                  "assets/images.jfif",
                  height: 400,
                  width: 400,
                )),
            PageViewModel(
                titleWidget: const Text(
                  "OngozaHealth App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                body:
                    "L’indice de masse corporelle (IMC) est le seul indice validé par l’Organisation mondiale de la santé pour évaluer la corpulence d’un individu et donc les éventuels risques pour la santé.",
                image: Image.asset(
                  "assets/drawing-s-p.png",
                  height: 800,
                  width: 800,
                )),
          ],
          onDone: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
              return masse();
            }));
          },
          onSkip: () {},
          showSkipButton: true,
          skip: const Text(
            "skip",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: (Colors.pinkAccent),
            ),
          ),
          next: const Icon(
            Icons.arrow_forward,
            color: (Colors.pinkAccent),
          ),
          done: const Text(
            "Done",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: (Colors.pinkAccent),
            ),
          ),
          dotsDecorator: DotsDecorator(
              size: Size.square(10.0),
              activeSize: Size(20.0, 10.0),
              color: Colors.black26,
              activeColor: (Colors.pinkAccent),
              spacing: EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              )),
        ),
      ),
    );
  }
}
