class Profession {
  String metier;

  String competence(List<String> competences) {
    StringBuffer sb = StringBuffer();

    sb.writeln("Le $metier a les compétences suivantes : ");

    for (String c in competences) {
      sb.writeln("- $c");
    }

    return sb.toString();
  }
}
