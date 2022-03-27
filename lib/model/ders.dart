class Ders {
  final String isim;
  final double harfDegeri;
  final double krediDegeri;

  Ders(
      {required this.isim,
      required this.harfDegeri,
      required this.krediDegeri});
  @override
  String toString() {
    // TODO: implement toString
    return '$isim, $harfDegeri, $krediDegeri';
  }
}
