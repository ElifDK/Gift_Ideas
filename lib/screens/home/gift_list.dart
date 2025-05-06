import 'package:flutter/material.dart';
import 'package:gift_idea/model/gift.dart';
import 'package:provider/provider.dart';
import 'gift_tile.dart';

class GiftList extends StatefulWidget {
  const GiftList({super.key});

  @override
  State<GiftList> createState() => _GiftListState();
}

class _GiftListState extends State<GiftList> {

  @override
  Widget build(BuildContext context) {
    final gifts = Provider.of<List<Gift>?>(context);
    return ListView.builder(
        itemCount: gifts?.length ?? 0,
        itemBuilder: (context, index) {
          if (gifts != null) {
          return GiftTile(gift: gifts.elementAt(index));
        }
        return null;});
  }
}
