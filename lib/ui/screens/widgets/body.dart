import 'package:currency_converts/services/currency_convert.dart';
import 'package:currency_converts/ui/screens/widgets/text_field.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _brlController = TextEditingController();
  final _usdController = TextEditingController();
  final _eurController = TextEditingController();

  double brl = 0.0;
  double usd = 0.0;
  double eur = 0.0;

  final _api = CurrencyConvertService();

  @override
  void initState() {
    _brlController.text = '';
    _usdController.text = '';
    _eurController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: _api.getCurrency(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.amber),
                ),
              );
            default:
              usd = snapshot.data['results']['currencies']['USD']['buy'];
              eur = snapshot.data['results']['currencies']['EUR']['buy'];
              print(usd);
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                        label: 'Real',
                        controller: _brlController,
                        prefix: 'R\$ ',
                        onChanged: _realChanged
                    ),
                    CustomTextField(
                      label: 'Dólar',
                      prefix: 'US\$ ',
                      controller: _usdController,
                      onChanged: _dollarChanged,
                    ),
                    CustomTextField(
                        label: 'Euro',
                        prefix: '€   ',
                        controller: _eurController,
                        onChanged: _euroChanged
                    ),
                  ],
                ),
              );
          }
        });
  }

  void _realChanged(String text) {
    if (text.isNotEmpty) {
      brl = double.parse(text);
      _usdController.text = (brl * usd).toStringAsFixed(2);
      _eurController.text = (brl * eur).toStringAsFixed(2);
    } else {
      _cleanAll();
    }
  }

  void _euroChanged(String text) {
    if (text.isNotEmpty) {
      double eurInputed= double.parse(text);
      _brlController.text = (eurInputed * this.eur).toStringAsFixed(2);
      _usdController.text = ((eurInputed * this.eur) / this.usd).toStringAsFixed(2);
    } else {
      _cleanAll();
    }
  }

  void _dollarChanged(String text) {
    if (text.isNotEmpty) {
      double usdInputed = double.parse(text);
      _brlController.text = (usdInputed * this.usd).toStringAsFixed(2);
      _eurController.text = ((usdInputed * this.usd) / eur).toStringAsFixed(2);
    } else {
      _cleanAll();
    }
  }

  void _cleanAll() {
    _brlController.text = '';
    _usdController.text = '';
    _eurController.text = '';
  }
}
