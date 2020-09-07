import 'package:flutter/material.dart';
import 'package:projeto_despesas_pessoais/components/chart.dart';
import 'package:projeto_despesas_pessoais/components/transaction_form.dart';
import 'package:projeto_despesas_pessoais/components/transaction_list.dart';
import 'package:projeto_despesas_pessoais/models/transaction.dart';
import 'dart:math';


main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home : MyHomePage(), 
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title : TextStyle(
              fontFamily: 'OpenSans',
              fontSize : 18,
              fontWeight: FontWeight.w700
            ),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title : TextStyle(
              fontFamily: 'OpenSans',
              fontSize : 20,
              fontWeight: FontWeight.w700
            )
          )
        ),
      ),
    );
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

      Navigator.of(context).pop();
  }

  final List<Transaction> _transactions = [
      Transaction(
        id : 't1',
        title : 'Novo Tênis de Corrida',
        value : 310.76,
        date : DateTime.now().subtract(Duration(days: 3)),
      ),
      Transaction(
        id : 't2',
        title : 'Conta de Luz',
        value : 100.23,
        date : DateTime.now().subtract(Duration(days: 4)),
      ),
    ];

    List<Transaction> get _recentTransactions {
      return _transactions.where((tr) {
        return tr.date.isAfter(DateTime.now().subtract(
          Duration(days: 7)
        ));
      }).toList();
    }

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
            Chart(_recentTransactions),
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