import 'package:calculator/providers/operations.dart';
import 'package:calculator/widgets/btn_calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final operationProvider = Provider.of<OperationProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                height: 10,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      operationProvider.operation.toString(),
                    ),
                    Text(
                      operationProvider.total.toString(),
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnCalculator(title: "C"),
                    BtnCalculator(title: "+/-"),
                    BtnCalculator(title: "%"),
                    BtnCalculator(title: "/"),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnCalculator(title: "7"),
                    BtnCalculator(title: "8"),
                    BtnCalculator(title: "9"),
                    BtnCalculator(title: "x"),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnCalculator(title: "4"),
                    BtnCalculator(title: "5"),
                    BtnCalculator(title: "6"),
                    BtnCalculator(title: "-"),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnCalculator(title: "1"),
                    BtnCalculator(title: "2"),
                    BtnCalculator(title: "3"),
                    BtnCalculator(title: "+"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const BtnCalculator(title: "←"),
                    const BtnCalculator(title: "0"),
                    const BtnCalculator(title: "."),
                    BtnCalculator(title: "=", function: () => operationProvider.operateCharacter()),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            )
          ],
        ),
      ),
    );
  }
}
