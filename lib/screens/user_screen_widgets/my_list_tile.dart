import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  const MyListTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.trailing,
      required this.onTap});
  final IconData leading;
  final String title;
  final IconData trailing;
  final Function onTap;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          leading: Icon(widget.leading),
          title: Text(widget.title),
          trailing: Icon(widget.trailing),
          onTap: (() {
            widget.onTap();
          })),
    );
  }
}
