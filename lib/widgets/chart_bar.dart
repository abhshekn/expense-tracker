import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalSpending;
  final double totalSpendingPct;

  ChartBar(this.label, this.totalSpending, this.totalSpendingPct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('\$${totalSpending.toStringAsFixed(0)}'),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          width: 15,
          height: 60,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: const Color.fromRGBO(
                    220,
                    220,
                    220,
                    1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: totalSpendingPct,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
