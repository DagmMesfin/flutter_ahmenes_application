import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Apod> fetchApod(date) async {
  final response = await http.get(Uri.parse(
      'https://api.nasa.gov/planetary/apod?api_key=8AdpOEvuLkF4fGJBno12wSm4H8Lzo4c0XApTHDeW&thumbs=true&date=$date'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Apod.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Connection Failed!');
  }
}

class Apod {
  String? copyright;
  String? date;
  String? explanation;
  String? mediaType;
  String? serviceVersion;
  String? thumbnailUrl;
  String? title;
  String? url;

  Apod(
      {this.copyright,
      this.date,
      this.explanation,
      this.mediaType,
      this.serviceVersion,
      this.thumbnailUrl,
      this.title,
      this.url});

  Apod.fromJson(Map<String, dynamic> json) {
    copyright = json['copyright'];
    date = json['date'];
    explanation = json['explanation'];
    mediaType = json['media_type'];
    serviceVersion = json['service_version'];
    thumbnailUrl = json['thumbnail_url'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['copyright'] = this.copyright;
    data['date'] = this.date;
    data['explanation'] = this.explanation;
    data['media_type'] = this.mediaType;
    data['service_version'] = this.serviceVersion;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
