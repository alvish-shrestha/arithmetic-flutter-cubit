import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arithmetic_bloc/cubit/arithmetic_cubit.dart';

class ArithmeticCubitView extends StatelessWidget {
  ArithmeticCubitView({super.key});

  final firstNumberController = TextEditingController();
  final lastNumberController = TextEditingController();
  final myKey = GlobalKey<FormState>();

  int getNumber(TextEditingController controller) {
    return int.tryParse(controller.text) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arithmetic"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: myKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: firstNumberController,
                decoration: const InputDecoration(
                  labelText: "Enter first number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: lastNumberController,
                decoration: const InputDecoration(
                  labelText: "Enter second number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (myKey.currentState!.validate()) {
                    int first = getNumber(firstNumberController);
                    int second = getNumber(lastNumberController);
                    context.read<ArithmeticCubit>().add(first, second);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Add"),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (myKey.currentState!.validate()) {
                    int first = getNumber(firstNumberController);
                    int second = getNumber(lastNumberController);
                    context.read<ArithmeticCubit>().subtract(first, second);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Subtract"),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  if (myKey.currentState!.validate()) {
                    int first = getNumber(firstNumberController);
                    int second = getNumber(lastNumberController);
                    context.read<ArithmeticCubit>().multiply(first, second);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Multiply"),
              ),
              SizedBox(height: 24),
              BlocBuilder<ArithmeticCubit, int>(
                builder: (context, state) {
                  return Text(
                    'Result: $state',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center, // hello
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
