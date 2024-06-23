import 'package:flutter/material.dart';
import 'package:health/conseil.dart';

class masse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return imc();
  }
}

class imc extends State<masse> {
  final TextEditingController tf1 = TextEditingController();
  final TextEditingController tf2 = TextEditingController();
  final TextEditingController tf3 = TextEditingController();
  final TextEditingController tf4 = TextEditingController();
  double _resultat = 0.0;
  String _msg = "";
  String _alert = "";
  String message = "";
  void indice() {
    setState(() {
      _resultat = Calculer(tf4.text, tf3.text);
      _msg = "Votre IMC est $_resultat";

      if (_resultat <= 18.4) {
        message =
            "Comment ne plus être en dénutrition ? La dénutrition peut se traiter en enrichissant l'alimentation avec des produits de base : lait concentré entier, beurre fondu, crème fraîche, pâtes, semoule... Il est également possible d'augmenter la fréquence des prises alimentaires";
        _alert = "Insuffisance pondérale (dénutrition)";
      } else if (_resultat >= 18.5 && _resultat <= 24.9) {
        message =
            "Félicitations!! Vous êtes en bonne santé.Pour préserver votre santé mangez au moins cinqs fruits et légumes par jour en suite buver beaucoup d'eau cela vous permettra d'être toujours en forme.";
        _alert = "Corpulence normale (bonne santé)";
      } else if (_resultat >= 25 && _resultat <= 29.9) {
        message =
            "Remplacer deux repas par jour par deux shakes de cette nouvelle boisson peut vous aider à vous débarrasser de votre surpoids.Parlez-en avec votre médecin. Il pourra vous aider à interpréter votre IMC, vous prescrire si besoin des analyses complémentaires (bilan des graisses et des sucres) et vous conseiller.";
        _alert = "Surpoids";
      } else if (_resultat >= 30 && _resultat <= 34.9) {
        message =
            "Mangez suffisamment et lentement, en mastiquant bien chaque bouchée. Évitez de manger debout et prenez vos repas bien assis, face à une table. Essayez de prendre vos repas avec d'autres personnes, si possible dans la convivialité.";
        _alert = "Obésité modérée";
      } else if (_resultat >= 40 && _resultat <= 40.9) {
        message =
            "Au quotidien, il est recommandé d'adopter certains gestes:Pratiquer une activité sportive régulière : 30 minutes de sport par jour permettent de réduire les risques de maladies cardiovasculaires et de diabète. ...Avoir une alimentation diversifiée et équilibrée ;Limiter sa consommation de graisses saturées.";
        _alert = "Obésité sévère";
      } else if (_resultat >= 40 && _resultat <= 40.9) {
        message =
            "Le traitement de l'obésité morbide ou massive:La perte de poids doit s'effectuer de manière raisonnée ; une alimentation équilibrée et une pratique sportive régulière permettent de maigrir de façon progressive sans mettre en danger physique et psychique la personne concernée. Il est conseillé d'avoir un suivi thérapeutique adapté.";
        _alert = "Obésité morbide ou massive";
      } else {
        message = "Votre IMC est delicat consultez un medecin immediatement, la sante n'a pas de prix prenez sois de vous et ameliorer votre IMC";
        _alert = "Mauvais";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OngozaHealth'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/1423769305268.jpg',
                height: 50,
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                height: 400.0,
                width: 450.0,
                color: Colors.white70,
                child: Column(
                  children: <Widget>[
                    TextField(
                        controller: tf1,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            hintText: 'Nom', icon: Icon(Icons.person))),
                    TextField(
                      controller: tf2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Age', icon: Icon(Icons.add)),
                    ),
                    TextField(
                      controller: tf3,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Taille (1.65)',
                          icon: Icon(Icons.lock_clock)),
                    ),
                    TextField(
                      controller: tf4,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Poids en Kg', icon: Icon(Icons.menu)),
                    ),
                    const Padding(padding: EdgeInsets.all(13.0)),
                    Center(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 95.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.pinkAccent,
                                  onPrimary: Colors.white,
                                ),
                                onPressed: indice,
                                child: const Text('CALCULER')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  _msg,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  _alert,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 152, 75, 101),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              BoutonConseil(context, message),
            ],
          ),
        ),
      ),
    );
  }
}

double Calculer(String poid, String taille) {
  if (double.parse(taille).toString().isNotEmpty &&
      int.parse(poid).toString().isNotEmpty) {
    return (int.parse(poid)) / (double.parse(taille) * double.parse(taille));
  } else {
    return 0;
  }
}

BoutonConseil(BuildContext context, String message) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
        child: TextButton.icon(
          onPressed: () {
            if (message != '') {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Conseil(message: message);
              }));
            }
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              )),
            icon: Icon(Icons.folder_copy, color: Colors.white),
            label: Text("VOTRE GUIDE"),
        ),
      )
    ],
  );
}
