import 'package:flutter/material.dart';
import 'package:pj1/View/collection/collectionComp.dart';

void showAlertDialog(BuildContext context, CollectionItem item) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        title: Text('알림'),
        content: Text('메시지 내용'),
        actions: [],
      );
    },
  );
}
