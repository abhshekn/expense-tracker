import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final Function deleteTxn;

  TransactionList(this.transactions, this.deleteTxn, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  const Text(
                    'No Expense recorded yet',
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png'),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                                '\$ ${transactions[index].amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => deleteTxn(transactions[index].id),
                        icon: const Icon(
                          Icons.delete,
                        ),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  );
                },
              ));
  }
}
