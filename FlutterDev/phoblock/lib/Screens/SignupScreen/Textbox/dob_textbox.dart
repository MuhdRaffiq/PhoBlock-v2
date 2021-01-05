import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class DOBTextBox extends StatelessWidget {
  final textController;
  final formKey;
  static const double _hPad = 40.0;

  DOBTextBox(this.textController, this.formKey);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(_hPad, 0.0, _hPad, 5.0),
            child: TextFormField(
              keyboardType: TextInputType.datetime,
              controller: textController,
              onTap: () async {
                DateTime date = DateTime(1900);
                FocusScope.of(context).requestFocus(new FocusNode());

                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2050),
                  initialEntryMode: DatePickerEntryMode.input,
                  builder: (BuildContext context, Widget child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light().copyWith(
                          primary: hexToColor('#64B6A9'),
                          background: Colors.white,
                        ),
                      ),
                      child: child,
                    );
                  },
                );

                var formatter = new DateFormat('yyyy-MM-dd');
                textController.text = formatter.format(date);
              },
              validator: (value) {
                var now = new DateTime.now();
                var formatter = new DateFormat('yyyy-MM-dd');
                String formattedDate = formatter.format(now);

                var df1 = DateFormat('yyyy-MM-dd').parse(value);
                var df2 = DateFormat('yyyy-MM-dd').parse(formattedDate);

                if (df1.isAfter(df2)) {
                  return 'Invalid Date of Birth';
                } else {
                  return null;
                }
              },
              decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Colors.black12, width: 7.0),
                ),
                hintText: 'Date of Birth',
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
