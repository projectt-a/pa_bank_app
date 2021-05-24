import 'package:flutter/material.dart';

import 'compact_credit_card_widgets/CompactAppleCard.dart';
import 'compact_credit_card_widgets/CompactMasterCard.dart';
import 'compact_credit_card_widgets/CompactVisaCard.dart';

class CompactCardListComponent extends StatelessWidget {
  const CompactCardListComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CompactAppleCard(),
              CompactMasterCard(),
              CompactVisaCard(),
            ],
          ),
        ),
      ),
    );
  }
}
