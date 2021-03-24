class ThisForThat {
  final String tThis;
  final String that;
  ThisForThat({
    this.tThis,
    this.that,
  });

  factory ThisForThat.fromJSON(Map<String, dynamic> json) {
    return ThisForThat(
      tThis: json['this'],
      that: json['that'],
    );
  }
}
