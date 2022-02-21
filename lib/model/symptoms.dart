class Symptoms {
  int id;
  String text;
  Map<String, double> indicates;

  Symptoms( this.id,  this.text,  this.indicates);

  @override
  String toString() {
    return text + indicates.toString();
  }


}