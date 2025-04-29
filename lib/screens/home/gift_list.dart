import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GiftList extends StatefulWidget {
  const GiftList({super.key});

  @override
  State<GiftList> createState() => _GiftListState();
}

class _GiftListState extends State<GiftList> {


  @override
  Widget build(BuildContext context) {
    final gifts = Provider.of<QuerySnapshot?>(context);
    for (var doc in gifts!.docs) {
      print(doc.data());
    }
    return const Placeholder();
  }
}
