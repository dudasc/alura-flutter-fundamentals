import 'package:byte/components/transfers/editor.dart';
import 'package:byte/models/transfer.dart';
import 'package:flutter/material.dart';

class FormTranfer extends StatefulWidget {
  const FormTranfer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormTranferState();
  }
}

class FormTranferState extends State<FormTranfer> {
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  static const _title = 'Create Transfers';
  static const _labelAccountNumber = 'Account number';
  static const _hintAccountNumber = '0000';
  static const _labelValue = 'Value';
  static const _hintValue = '0.0';
  static const _textButton = 'Send';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _accountNumberController,
              label: _labelAccountNumber,
              hint: _hintAccountNumber,
            ),
            Editor(
              controller: _valueController,
              label: _labelValue,
              hint: _hintValue,
              icon: Icons.monetization_on,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => _createTransfer(context),
                child: const Text(_textButton),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? accountNumber = int.tryParse(_accountNumberController.text);
    final double? value = double.tryParse(_valueController.text);

    if (accountNumber != null && value != null) {
      final transferCreated = Transfer(accountNumber, value);
      debugPrint('Creating transfer');
      debugPrint('$transferCreated');
      Navigator.pop(context, transferCreated);
    }
  }
}
