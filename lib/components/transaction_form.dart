import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm(){
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    onSubmit(title, value);

    if(title.isEmpty || value <= 0){
      return;
    }

  }

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation : 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children : <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título'
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal : true),
              onSubmitted: (_) => _submitForm(),
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
                  onPressed: _submitForm,
                ),
              ],
            )
          ]
        ),
      )
    );
  }
}