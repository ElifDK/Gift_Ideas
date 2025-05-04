import 'package:flutter/material.dart';
import 'package:gift_idea/model/gift.dart';

class GiftTile extends StatelessWidget {
  final Gift gift;
  GiftTile({required this.gift, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.orange,
          ),
          title: Text(gift.name),
          subtitle: Column(
            children: [
              Text(gift.wishOne),
              Text(gift.wishTwo),
              Text(gift.wishThree),
            ],
          ),
        ),
      ),
    );
  }
}
