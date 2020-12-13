import 'package:flutter/material.dart';
import 'proposal_body.dart';
import '../title_header.dart';
import '../../../style.dart';

class Proposal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleHeader('Proposal'),
          ProposalWidget(),
          //Text('1. Create a page dedicated only to BLM'),
        ],
      ),
    );
  }
}
