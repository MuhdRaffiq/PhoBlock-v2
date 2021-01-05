import 'package:flutter/material.dart';
import 'proposal_body.dart';
import '../title_header.dart';
import '../../../style.dart';

/*
  Author: Muhammad Khairi Norizan
*/
class Proposal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleHeader('Proposal'),
          ProposalWidget(),
        ],
      ),
    );
  }
}
