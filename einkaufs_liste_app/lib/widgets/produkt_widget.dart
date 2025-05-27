import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduktWidget extends StatelessWidget {
  final String produktName;
  final bool produktChecked;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunktion;

  const ProduktWidget({
    super.key,
    required this.produktName,
    required this.produktChecked,
    required this.onChanged,
    required this.deleteFunktion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunktion,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          height: 80,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.black,
                value: produktChecked,
                onChanged: onChanged,
              ),
              Text(
                produktName,
                style: TextStyle(
                  fontSize: 20,
                  decoration:
                      produktChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
