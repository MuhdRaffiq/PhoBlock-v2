import 'package:flutter/material.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class WalletTextBox extends StatelessWidget {
  final textController;
  final formKey;
  static const double _hPad = 40.0;

  WalletTextBox(this.textController, this.formKey);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 30.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: textController,
              validator: (value) {
                if (value.isNotEmpty) {
                  if (value.length < 42) {
                    return 'Invalid Wallet Address Input';
                  }

                  if (value.length == 42 && !value.startsWith('0x')) {
                    return 'Invalid Wallet Address Input';
                  }
                }

                return null;
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.black12, width: 7.0),
                ),
                hintText: 'Wallet Address',
                hintStyle: TextStyle(
                  fontFamily: 'Lalezar',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
