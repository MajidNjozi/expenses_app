import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewTransaction extends StatelessWidget {
  final Function myFunction;

  NewTransaction(this.myFunction);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                label: Text('Title'),
              ),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                label: Text('Amount'),
              ),
            ),
            TextButton(
              onPressed: () {
                // print(titleController.text);
                // print(amountController.text);
                myFunction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: Text(
                'Add Transaction',
              ),
            )
          ],
        ),
      ),
    );
  }
}
