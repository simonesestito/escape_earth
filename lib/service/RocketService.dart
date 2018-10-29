/*
 * Copyright © 2018 Simone Sestito, Patrizio Renelli, Gianluca Conti
 * 
 * This file is part of Escape Earth.
 * 
 * Escape Earth is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * Escape Earth is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with Escape Earth.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'dart:async';
import 'dart:convert';
import 'package:escape_earth/model/Agency.dart';
import 'package:escape_earth/model/RocketLaunch.dart';
import 'package:escape_earth/utils.dart';
import 'package:http/http.dart' as http;

class RocketService {
  static Future<RocketLaunch> getNextLaunch() async {
    if (!(await isConnected())) {
      throw StateError("Device offline.");
    }

    final response =
        await http.get("https://launchlibrary.net/1.4/launch?next=1");
    final content = json.decode(response.body)["launches"][0];
    final agency = await getAgencyById(content["lsp"]);
    return RocketLaunch(
      country: agency.countryCode,
      launchCompany: agency,
      name: content["name"],
      date: content["windowstart"],
      videoUrl: (content["vidURLs"] ?? [null])[0],
    );
  }

  static Future<List<RocketLaunch>> getLaunches({String query}) async {
    if (!(await isConnected())) {
      throw StateError("Device offline.");
    }

    http.Response rawLaunchesResponse;
    if (query == null || query == "") {
      rawLaunchesResponse =
          await http.get("https://launchlibrary.net/1.4/launch?next=25");
    } else {
      rawLaunchesResponse = await http
          .get("https://launchlibrary.net/1.4/launch?next=25&name=$query");
    }

    final List<dynamic> launchesContent =
        json.decode(rawLaunchesResponse.body)["launches"];

    // Get details about every single agency
    // Use the following technique to avoid duplicate requests

    // (1) Keep a Map with:
    // - key: the ID of the agency
    // - value: the Future for the request to get details about that agency
    final agencyRequests = Map<String, Future<Agency>>();

    for (Map item in launchesContent) {
      final agencyId = item["lsp"];
      // (2) Check if there is already a pending request for this agency
      if (agencyRequests.containsKey(agencyId)) {
        // No need to perform another request
      } else {
        // Perform the request for this agency FOR THE FIRST TIME
        // and add it to the Map of pending requests
        agencyRequests[agencyId] = getAgencyById(agencyId);
      }
    }

    // Await for all those requests
    // Remember: with this technique there will only be ONE SINGLE request for each agency
    final resolvedAgenciesMap = (await Future.wait(agencyRequests.values))
        .asMap()
        .map((_, agency) => MapEntry(agency.id, agency));

    final result = <RocketLaunch>[];
    for (int i = 0; i < launchesContent.length; i++) {
      final currentLaunch = launchesContent[i];
      final requestedAgencyId = currentLaunch["lsp"];
      final Agency resolvedAgency = resolvedAgenciesMap[requestedAgencyId];
  
      result.add(RocketLaunch(
        country: resolvedAgency.countryCode,
        launchCompany: resolvedAgency,
        name: currentLaunch["name"],
        date: currentLaunch["windowstart"],
        videoUrl: (currentLaunch["vidURLs"] ?? [null])[0],
      ));
    }
    return result;
  }

  static Future<Agency> getAgencyById(String id) async {
    if (!(await isConnected())) {
      throw StateError("Device offline.");
    }

    final raw = await http.get("https://launchlibrary.net/1.4/agency/$id");
    final agency = json.decode(raw.body)["agencies"][0];
    return Agency(
      id: agency["id"].toString(),
      name: agency["name"],
      countryCode: agency["countryCode"],
    );
  }
}