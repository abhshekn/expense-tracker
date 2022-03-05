import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(this.createNewTransaction, {Key? key}) : super(key: key);
  final Function createNewTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    createNewTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                onSubmitted: (_) => submitData(),
                controller: titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
                onSubmitted: (_) => submitData(),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              FlatButton(
                onPressed: submitData,
                textColor: Colors.purple,
                child: const Text('Add Transaction'),
              )
            ],
          ),
        ));
  }
}
