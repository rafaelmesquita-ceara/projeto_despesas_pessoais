import 'package:flutter/material.dart';
import 'package:projeto_despesas_pessoais/components/transaction_form.dart';
import 'package:projeto_despesas_pessoais/components/transaction_list.dart';
import 'package:projeto_despesas_pessoais/models/transaction.dart';
import 'dart:math';


main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( home : MyHomePage() );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(), 
      title: title, 
      value: value, 
      date: DateTime.now()
      );

      setState(() {
        _transactions.add(newTransaction);
      });
  }

  final _transactions = [
      Transaction(
        id : 't1',
        title : 'Novo Tênis de Corrida',
        value : 310.76,
        date : DateTime.now(),
      ),
      Transaction(
        id : 't2',
        title : 'Conta de Luz',
        value : 100.23,
        date : DateTime.now(),
      ),
    ];

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      body : SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children : <Widget>[
            Container(
              child: Card(
                color : Colors.blue,
                child : Text('Gráfico'),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}