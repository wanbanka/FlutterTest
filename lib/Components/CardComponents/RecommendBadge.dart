import 'package:flutter/material.dart';
import '../Utilities/Colors.dart';

class RecommendBadge extends StatefulWidget {
  final String organisateur;
  final int coactivites;
  final int recommandations;

  RecommendBadge(
      {@required this.organisateur,
      @required this.coactivites,
      @required this.recommandations,
      Key key})
      : super(key: key);

  @override
  _RecommendBadgeState createState() => _RecommendBadgeState();
}

class _RecommendBadgeState extends State<RecommendBadge> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Proposée par ${widget.organisateur.substring(0, 1)}. (",
            style: TextStyle(color: colorBlack)),
        TextSpan(
            text: "${widget.coactivites}",
            style: TextStyle(backgroundColor: Color(0xff17a2b8))),
        TextSpan(
            text: "${widget.recommandations}",
            style: TextStyle(
                backgroundColor: Color(0xffffc107), color: colorBlack)),
        TextSpan(text: ")", style: TextStyle(color: colorBlack)),
      ]),
    );
  }
}
