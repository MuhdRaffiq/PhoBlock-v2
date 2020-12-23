import 'package:flutter/material.dart';
import 'bio_field.dart';
import 'birthday_field.dart';
import 'email_field.dart';
import 'phone_field.dart';
import 'username_field.dart';
import '../../../style.dart';

class EditProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 3.0, color: Colors.black45),
          bottom: BorderSide(width: 3.0, color: Colors.black45),
        ),
      ),
      child: Column(
        children: [
          UsernameField(),
          BioField(),
          EmailField(),
          PhoneField(),
          BirthdayField(),
        ],
      ),
    );
  }
}
