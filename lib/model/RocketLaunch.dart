import 'package:escape_earth/model/Agency.dart';
import 'package:meta/meta.dart';

@immutable
class RocketLaunch {
  final String name;
  final String country;
  final Agency launchCompany;
  final String date;
  final String videoUrl;

  RocketLaunch({
    @required this.name,
    @required this.country,
    @required this.launchCompany,
    @required this.date,
    this.videoUrl,
  });
}