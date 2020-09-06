import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final valueController = TextEditingController();

    return Card(
      elevation : 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children : <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título'
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                  onPressed: () {
                    print(titleController.text);
                    print(valueController.text);
                  },
                ),
              ],
            )
          ]
        ),
      )
    );
  }
}