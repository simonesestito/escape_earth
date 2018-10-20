import 'package:meta/meta.dart';

@immutable
class Agency {
  final String countryCode;
  final String name;

  Agency({
    this.countryCode,
    this.name,
  });

  @override
    String toString() {
      return "$name ($countryCode)";
    }
}