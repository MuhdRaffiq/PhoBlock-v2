import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class BirthdayField extends StatelessWidget {
  final textController;
  final textFormKey;

  BirthdayField(this.textController, this.textFormKey);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: textFormKey,
      child: Container(
        margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 20.0),
        child: Row(
          children: [
            Container(
              width: 80.0,
              child: Text('Birthday: '),
            ),
            Flexible(
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "", //"Enter Birthday",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(8.0),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: textController,
                onTap: () async {
                  DateTime date = DateTime(1900);
                  FocusScope.of(context).requestFocus(new FocusNode());

                  date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2021),
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
                style: new TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
