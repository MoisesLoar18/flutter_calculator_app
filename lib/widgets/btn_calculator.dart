import 'package:calculator/providers/operations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BtnCalculator extends StatelessWidget {
  final String title;
  final Function? function;

  const BtnCalculator({
    super.key,
    required this.title,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    final operationProvider = Provider.of<OperationProvider>(context);
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        if (function != null) {
          operationProvider.operateCharacter();
        } else {
          operationProvider.writeOperation(title);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        width: size.width * .2,
        height: size.height * .1,
        child: Text(
          title,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
