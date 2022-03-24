import 'package:byte/models/transfer.dart';
import 'package:byte/screens/transfers/form.dart';
import 'package:flutter/material.dart';

class TransferList extends StatefulWidget {
  TransferList({Key? key}) : super(key: key);

  final List _transferList = [];

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  static const _title = 'Transfers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: ListView.builder(
        itemCount: widget._transferList.length,
        itemBuilder: (context, index) {
          final transfer = widget._transferList[index];

          return TransferListItem(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FormTranfer();
          }));

          future.then((transferReceived) {
            _refresh(transferReceived);
          });
        },
      ),
    );
  }

  void _refresh(Transfer transferReceived) {
    // ignore: unnecessary_null_comparison
    if (transferReceived != null) {
      setState(() {
        widget._transferList.add(transferReceived);
      });
    }
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
