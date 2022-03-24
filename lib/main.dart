import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormTranfer(),
      ),
    );
  }
}

class FormTranfer extends StatelessWidget {
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  FormTranfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fazer transferência')),
      body: Column(
        children: <Widget>[
          Editor(
            controller: _accountNumberController,
            label: 'Account number',
            hint: '0000',
          ),
          Editor(
            controller: _valueController,
            label: 'Value',
            hint: '0.0',
            icon: Icons.monetization_on,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _createTransfer(),
              child: const Text('Enviar'),
            ),
          ),
        ],
      ),
    );
  }

  void _createTransfer() {
    final int? accountNumber = int.tryParse(_accountNumberController.text);
    final double? value = double.tryParse(_accountNumberController.text);

    if (value != null && accountNumber != null) {
      final transfer = Transfer(accountNumber, value);
      debugPrint('$transfer');
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icon;

  Editor({this.controller, this.label, this.hint, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(label: Text(label!), hintText: hint, icon: icon != null ? Icon(icon) : null),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  const TransferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferencias')),
      body: Column(
        children: [
          TransferListItem(Transfer(59635, 100.0)),
          TransferListItem(Transfer(2023, 99.0)),
          TransferListItem(Transfer(9980, 538.4)),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class TransferListItem extends StatelessWidget {
  final Transfer _transfer;

  // ignore: use_key_in_widget_constructors
  const TransferListItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}

class Transfer {
  final int accountNumber;
  final double value;

  Transfer(this.accountNumber, this.value);

  @override
  String toString() {
    return 'Transfer{accountNumber: $accountNumber, value: $value}';
  }
}
