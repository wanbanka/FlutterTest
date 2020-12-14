import 'package:flutter/material.dart';
import '../Utilities/Colors.dart';

class TagBadge extends StatefulWidget {
  final String nom;

  TagBadge({@required this.nom, Key key}) : super(key: key);

  @override
  _TagBadgeState createState() => _TagBadgeState();
}

class _TagBadgeState extends State<TagBadge> {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return TextButton(
      child: Text("${widget.nom}",
          style: TextStyle(
              color: colorWhite, fontSize: 20.0, fontWeight: FontWeight.bold)),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff28a745)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)))),
    );
  }
}
