import 'package:flutter/material.dart';

class HintText extends StatelessWidget {
  const HintText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.name,
              obscureText: false,
              decoration: new InputDecoration(
                hintText: "Nama User",
                labelText: "Nama",
                icon: Icon(Icons.people),
                border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.blueGrey
                ),
                onPressed: (){},
                child: const Text('Disabled'),
              ),
          ],
        ),
      ),
    );
  }
}
// Mufahid15