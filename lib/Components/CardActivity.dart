import 'package:flutter/material.dart';

class CardActivity extends StatefulWidget {
  final DateTime date;
  final String lieu;
  final String type;
  final int distance;
  final double vitesse;
  final String parcours;
  final String groupe;
  final int participants;
  final String organisateur;
  final int coactivites;
  final int recommandations;
  final String description;
  final List<String> tags;
  final String image;
  final bool inscrit;

  CardActivity(
      {@required this.date,
      @required this.lieu,
      @required this.type,
      @required this.distance,
      @required this.vitesse,
      @required this.parcours,
      this.groupe,
      @required this.participants,
      @required this.organisateur,
      this.coactivites,
      this.recommandations,
      @required this.description,
      this.tags,
      @required this.image,
      @required this.inscrit,
      Key key})
      : super(key: key);

  @override
  _CardActivityState createState() => _CardActivityState();
}

class _CardActivityState extends State<CardActivity> {
  final Color colorRed = Color(0xfffb3c00);
  final Color colorBlack = Colors.black;
  final Color colorWhite = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xddffffff),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      child: Column(
        children: <Widget>[
          ListTile(
              leading: Icon(
                Icons.calendar_today_outlined,
                color: colorRed,
              ),
              title: Text(
                  "Le ${widget.date.day}/${widget.date.month}/${widget.date.year}, à ${widget.date.hour}:${widget.date.minute}"),
              trailing: Icon(
                Icons.directions_run,
                color: colorBlack,
                size: 35.0,
              )),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: colorRed,
            ),
            title: Text(
              "${widget.lieu}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          RichText(
            text: TextSpan(children: [
              WidgetSpan(child: Icon(Icons.nature, color: colorRed)),
              TextSpan(
                  text: "${widget.type} - ${widget.distance} km",
                  style: TextStyle(color: colorBlack)),
              WidgetSpan(child: Icon(Icons.speed_outlined, color: colorRed)),
              TextSpan(
                  text: "${widget.vitesse} km/h",
                  style: TextStyle(color: colorBlack)),
              WidgetSpan(child: Icon(Icons.directions, color: colorRed)),
              TextSpan(
                  text: "Parcours ${widget.parcours}",
                  style: TextStyle(color: colorBlack)),
            ]),
          ),
          widget.groupe != null
              ? RichText(
                  text: TextSpan(children: [
                    WidgetSpan(child: Icon(Icons.people_alt, color: colorRed)),
                    TextSpan(
                        text: "Activité liée au groupe ${widget.groupe}",
                        style: TextStyle(color: colorBlack))
                  ]),
                )
              : Text(""),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "${widget.participants} participant(s)",
                  style: TextStyle(color: colorBlack)),
            ]),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:
                      "Proposée par ${widget.organisateur.substring(0, 1)}. (",
                  style: TextStyle(color: colorBlack)),
              TextSpan(
                  text: "0",
                  style: TextStyle(backgroundColor: Color(0xff17a2b8))),
              TextSpan(
                  text: "0",
                  style: TextStyle(
                      backgroundColor: Color(0xffffc107), color: colorBlack)),
              TextSpan(text: ")", style: TextStyle(color: colorBlack)),
            ]),
          ),
          ListTile(
            title: Text("${widget.description}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text("Ultra-trail",
                    style: TextStyle(
                        color: colorWhite,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff28a745)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)))),
              ),
              TextButton(
                child: Text("Nature",
                    style: TextStyle(
                        color: colorWhite,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff28a745)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)))),
              )
            ],
          ),
          Row(
            children: [
              RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.forum, color: colorRed),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  color: colorWhite,
                  label: Text("0")),
              RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.messenger_outline, color: colorRed),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  color: colorWhite,
                  label: Text("ENVOYER UNE QUESTION")),
            ],
          ),
          widget.inscrit
              ? Row(
                  children: [
                    RaisedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add_box, color: colorRed),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                        color: colorWhite,
                        label: Text("S'INSCRIRE")),
                    RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.share, color: colorRed),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      color: colorWhite,
                      label: Text(""),
                    )
                  ],
                )
              : Text(""),
          Image.network(widget.image)
        ],
      ),
    );
  }
}
