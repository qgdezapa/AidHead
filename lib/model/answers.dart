class Answer {
  int id;
  String text;
  Map<String, double> indicates;

  Answer( this.id,  this.text,  this.indicates);

  @override
  String toString() {
    return text;
  }


}