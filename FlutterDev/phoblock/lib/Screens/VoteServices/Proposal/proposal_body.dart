import 'package:flutter/material.dart';
import '../custom_outline_button.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class ProposalWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProposalBody();
  }
}

class _ProposalBody extends State<ProposalWidget> {
  String _yes = 'Yes';
  String _no = 'No';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1. Create a page dedicated only to BLM'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                value: 'Yes',
                groupValue: 'No',
                onChanged: null,
              ),
              Text('Yes'),
              Radio(
                value: 'Yes',
                groupValue: 'No',
                onChanged: null,
              ),
              Text('No'),
            ],
          ),
          Text('2. A "following" feature to follow favorite photographer'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                value: 'Yes',
                groupValue: 'No',
                onChanged: null,
              ),
              Text('Yes'),
              Radio(
                value: 'Yes',
                groupValue: 'No',
                onChanged: null,
              ),
              Text('No'),
            ],
          ),
          Text('3. New service to have picture on top of the search page'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                value: 'Yes',
                groupValue: 'No',
                onChanged: null,
              ),
              Text('Yes'),
              Radio(
                value: 'Yes',
                groupValue: 'No',
                onChanged: null,
              ),
              Text('No'),
            ],
          ),
          CustomOutlineButton(
            text: "Submit Proposal",
            color: hexToColor('#64B6A9'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
