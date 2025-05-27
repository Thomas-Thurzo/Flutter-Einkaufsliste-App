import 'package:einkaufs_liste_app/model/produkt.dart';
import 'package:einkaufs_liste_app/widgets/dialog_box.dart';
import 'package:einkaufs_liste_app/widgets/produkt_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _dialogBoxController = TextEditingController();

  List<Produkt> einkaufsListe = [];

  void checkBoxChanged(int index) {
    setState(() {
      einkaufsListe.elementAt(index).produktChecked =
          !einkaufsListe.elementAt(index).produktChecked;
    });
  }

  void produktSpeichern() {
    setState(() {
      einkaufsListe.add(Produkt(name: _dialogBoxController.text));
      _dialogBoxController.clear();
    });
    Navigator.of(context).pop();
  }

  void produktLoeschen(int index) {
    setState(() {
      einkaufsListe.removeAt(index);
    });
  }

  void produktErstellen() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          dialogBoxController: _dialogBoxController,
          onSpeichern: produktSpeichern,
          onAbbrechen: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('Shopping Liste'),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: einkaufsListe.length,
        itemBuilder: (context, index) {
          return ProduktWidget(
            produktName: einkaufsListe.elementAt(index).name,
            produktChecked: einkaufsListe.elementAt(index).produktChecked,
            onChanged: (wert) => checkBoxChanged(index),
            deleteFunktion: (context) => produktLoeschen(index),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          produktErstellen();
        },
        foregroundColor: Colors.yellow,
        backgroundColor: Colors.black,
        child: Icon(Icons.add_circle, size: 50),
      ),
    );
  }
}
