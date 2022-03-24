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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _accountNumberController,
              style: const TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                label: Text('Conta'),
                hintText: '0000',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _valueController,
              style: const TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                label: Text('Valor'),
                icon: Icon(Icons.monetization_on),
                hintText: '0.0',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {                
                final int? accountNumber = int.tryParse(_accountNumberController.text);
                final double? value = double.tryParse(_accountNumberController.text);               

                if (value != null && accountNumber != null) {
                  final transfer = Transfer(accountNumber, value);

                  debugPrint('$transfer');
                }
              },
              child: const Text('Enviar'),
            ),
          ),
        ],
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
