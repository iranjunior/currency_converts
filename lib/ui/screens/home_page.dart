import 'package:currency_converts/ui/screens/widgets/body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Moedas', style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 0,
      ),
      body: Body(),
    );
  }
}
