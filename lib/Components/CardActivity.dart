import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'CardComponents/RecommendBadge.dart';
import 'CardComponents/TagBadge.dart';
import 'Utilities/Colors.dart';

class CardActivity extends StatefulWidget {
  final DateTime date;
  final String lieu;
  final String type;
  final String nom_officiel;
  final String site_internet_activite;
  final String activite;
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
  final bool distanciation;
  final int placesRestantes;

  CardActivity(
      {@required this.date,
      @required this.lieu,
      @required this.type,
      this.nom_officiel,
      this.site_internet_activite,
      @required this.activite,
      @required this.distance,
      @required this.vitesse,
      @required this.parcours,
      this.groupe,
      @required this.participants,
      @required this.organisateur,
      @required this.coactivites,
      @required this.recommandations,
      @required this.description,
      this.tags,
      this.image,
      @required this.inscrit,
      @required this.distanciation,
      @required this.placesRestantes,
      Key key})
      : super(key: key);

  @override
  _CardActivityState createState() => _CardActivityState();
}

class _CardActivityState extends State<CardActivity> {
  Map<String, dynamic> iconsByType = {
    "marche": Icons.directions_walk,
    "course": Icons.directions_run,
    "velo": Icons.directions_bike
  };

  buildTags() {
    List<Widget> tagBadges = [];

    if (widget.tags == null) {
      return Text("");
    }

    widget.tags.forEach((tag) {
      tagBadges = [...tagBadges, TagBadge(nom: tag)];
    });

    return tagBadges;
  }

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
              title: Text("${formatDate(widget.date, [
                "Le ",
                DD,
                " ",
                dd,
                " ",
                MM,
                " ",
                yyyy,
                ", à ",
                HH,
                ":",
                nn
              ])}"),
              trailing: Icon(
                iconsByType[widget.type.toLowerCase()],
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
                  text: "${widget.activite} - ${widget.distance} km",
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
          RecommendBadge(
              organisateur: widget.organisateur,
              coactivites: widget.coactivites,
              recommandations: widget.recommandations),
          ListTile(
            title: Text("${widget.description}"),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buildTags()),
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
          !widget.inscrit
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
          widget.image != null ? Image.network(widget.image) : Text("")
        ],
      ),
    );
  }
}
