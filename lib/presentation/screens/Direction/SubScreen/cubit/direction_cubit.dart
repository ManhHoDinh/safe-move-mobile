import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:traffic_solution_dsc/core/models/direction/direction.dart';
import 'package:traffic_solution_dsc/core/models/direction/route.dart';
import 'package:traffic_solution_dsc/presentation/screens/Direction/SubScreen/cubit/flexible_polyline.dart';
import 'dart:convert' as convert;

import '../../../../../core/models/direction/geometry.dart';

part 'direction_state.dart';
part 'direction_cubit.freezed.dart';

class DirectionCubit extends Cubit<DirectionState> {
  DirectionCubit() : super(DirectionState.initial());

  void getDirection(
      sourceText, LatLng source, destinationText, LatLng destination) async {
    try {
      print('loading');
      emit(DirectionState.loading());
      Direction res = await geDirectionAPI(
          sourceText, source, destinationText, destination);
      print('Done');
      Set<Polyline> _polylines = {};
      List<LatLng> latLen = [];
      res.route!.geometry!.coordinates!.forEach((e) {
        latLen.add(LatLng(e[0], e[1]));
      });
      print("Time Route");
      print(res.route!.distance);
      print(res.route!.duration);
      _polylines.add(Polyline(polylineId: PolylineId('1'), points: latLen));
      _polylines.add(Polyline(
        polylineId: PolylineId('2'),
        points: await geDirectionAPI2(
            sourceText, source, destinationText, destination),
        color: Colors.green,
      ));
      Duration dateTime = Duration(seconds: res.route!.duration!);

      emit(DirectionState.loaded(sourceText, source, destinationText,
          destination, dateTime, res.route!.distance!.toDouble(), _polylines));
    } catch (error) {
      print(error);
      emit(DirectionState.error(error.toString()));
    }
  }

  Future<Direction> geDirectionAPI(
      sourceText, LatLng source, destinationText, LatLng destination) async {
    final headers = {
      'X-RapidAPI-Host': 'trueway-directions2.p.rapidapi.com',
      'X-RapidAPI-Key': 'b1a1bfce34msh0287fa31caec574p100443jsnd9d5e7fc04c2',
    };

    final params = {
      'origin': '${source.latitude},${source.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
    };

    final url =
        Uri.parse('https://trueway-directions2.p.rapidapi.com/FindDrivingPath')
            .replace(queryParameters: params);

    final res = await http.get(url, headers: headers);
    final status = res.statusCode;
    if (status != 200) throw Exception('http.get error: statusCode= $status');
    var json = convert.jsonDecode(res.body);
    Direction result = Direction.fromJson(json);
    return result;
  }

  Future<List<LatLng>> geDirectionAPI2(String sourceText, LatLng source,
      String destinationText, LatLng destination) async {
    final String apiKey =
        'mCw9j3Y8s1Ppz82DFAH9qT1LWzJzVGTDyVg6g6f3148'; // Replace with your actual API key

    final Map<String, String> params = {
      'apikey': apiKey,
      'origin': '${source.latitude},${source.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'transportMode': 'car',
      'return': 'polyline' // Request polyline data for drawing the route
    };

    final Uri url = Uri.https('router.hereapi.com', '/v8/routes', params);

    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Parse the API response to extract route information
      final String polyline = data['routes'][0]['sections'][0]['polyline'];
      data['routes'].forEach((element) {
        print(1);
        print(element['sections'][0]['polyline']);
      });
      // final int distance =
      //     data['routes'][0]['sections'][0]['summary']['length'];
      // final int duration =
      //     data['routes'][0]['sections'][0]['summary']['duration'];
      print("===================================");
      print(data);
      var result = FlexiblePolyline.decode(polyline)
          .map((e) => LatLng(e.lat, e.lng))
          .toList();
      print(result);
      return result;
      //return Direction(route: Route(distance: distance, duration: duration, polyline: polyline));
    } else {
      throw Exception('Failed to load route data: ${response.statusCode}');
    }
  }
}
