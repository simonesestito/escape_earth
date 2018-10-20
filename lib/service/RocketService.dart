import 'dart:async';
import 'dart:convert';
import 'package:escape_earth/model/Agency.dart';
import 'package:escape_earth/model/RocketLaunch.dart';
import 'package:http/http.dart' as http;

class RocketService {
  static Future<List<RocketLaunch>> getLaunches() async {
    final rawLaunchesResponse =
        await http.get("https://launchlibrary.net/1.4/launch?next=25");
    final List<dynamic> launchesContent =
        json.decode(rawLaunchesResponse.body)["launches"];
    
    final agRequests = <Future>[];
    for (Map item in launchesContent) {
      agRequests.add(getAgencyById(item["lsp"]));
    }
    final allAgencies = await Future.wait(agRequests);
    
    final result = <RocketLaunch>[];
    for (int i = 0; i < launchesContent.length; i++) {
      result.add(RocketLaunch(
        country: allAgencies[i].countryCode,
        launchCompany: allAgencies[i],
        name: launchesContent[i]["name"],
        date: launchesContent[i]["windowstart"],
        videoUrl: launchesContent[i]["vidURLs"] == null ? null : launchesContent[i]["vidURLs"][0],
      ));
    }
    return result;
  }

  static Future<Agency> getAgencyById(String id) async {
    final raw = await http.get("https://launchlibrary.net/1.4/agency/$id");
    final agency = json.decode(raw.body)["agencies"][0];
    return Agency(
      name: agency["name"],
      countryCode: agency["countryCode"],
    );
  }
}
