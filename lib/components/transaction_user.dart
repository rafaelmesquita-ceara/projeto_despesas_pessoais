import 'package:flutter/material.dart';
import 'package:projeto_despesas_pessoais/components/transaction_form.dart';
import 'package:projeto_despesas_pessoais/components/transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}