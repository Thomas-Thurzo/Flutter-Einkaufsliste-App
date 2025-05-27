import 'package:einkaufs_liste_app/widgets/dialog_box_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController dialogBoxController;
  final VoidCallback onSpeichern;
  final VoidCallback onAbbrechen;

  const DialogBox({
    super.key,
    required this.dialogBoxController,
    required this.onSpeichern,
    required this.onAbbrechen,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: dialogBoxController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Bitte ein Produkt eingeben',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DialogBoxButton(text: 'Speichern', onPressed: onSpeichern),
                DialogBoxButton(text: 'Abbrechen', onPressed: onAbbrechen),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
