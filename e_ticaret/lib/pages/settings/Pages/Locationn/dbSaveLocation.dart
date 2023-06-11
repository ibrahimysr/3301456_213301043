// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

import 'package:e_ticaret/pages/settings/Pages/Locationn/function.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class dbSaveLocation extends StatefulWidget {
  const dbSaveLocation({super.key});

  @override
  State<dbSaveLocation> createState() => _dbSaveLocationState();
}

class _dbSaveLocationState extends State<dbSaveLocation> {
  LatLng points = LatLng(37.066666, 37.383331);

  //map zoom
  final MapController _mapController = MapController();
  final TextEditingController _adres_baslik = TextEditingController();

  final TextEditingController _adres_detay = TextEditingController();
  double _currentZoom = 13.0;

  void _zoomIn() {
    setState(() {
      _currentZoom++;
      _mapController.move(_mapController.center, _currentZoom);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentZoom--;
      _mapController.move(_mapController.center, _currentZoom);
    });
  }

//adres bilgileri alma
  Future<void> _getAddressFromLatLng() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(points.latitude, points.longitude);
    _adres_detay.text =
        "${placemarks[0].isoCountryCode} ${placemarks[0].country} ${placemarks[0].administrativeArea} ${placemarks[0].subAdministrativeArea} ${placemarks[0].street} Mahallesi No:${placemarks[0].subThoroughfare} ";
  }

  //kullanıcının konumunu alma
  void konumual() async {
    var konum = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      points.latitude = konum.latitude;
      points.longitude = konum.longitude;
      _mapController.move(points, _currentZoom);
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _getAddressFromLatLng();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appcolor,
        title: const Text(
          "Konumu Bul",
          style: TextStyle(fontFamily: 'Schyler', fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Stack(
                children: [
                  FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      center: points,
                      zoom: _currentZoom,
                      onTap: (tapPosition, point) {
                        setState(() {
                          points = point;
                        });

                        _getAddressFromLatLng();
                      },
                    ),
                    nonRotatedChildren: [
                      AttributionWidget.defaultWidget(
                        source: 'OpenStreetMap contributors',
                        onSourceTapped: null,
                      ),
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 100,
                            height: 100,
                            point: points,
                            builder: (context) => const Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    alignment: const Alignment(0, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: _zoomIn,
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: _zoomOut,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              width: 2, // the thickness
                              color: EnabledColor // the color of the border
                              ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          shape: const StadiumBorder(),
                          backgroundColor: Appcolor2,
                        ),
                        onPressed: () {
                          konumual();
                          _getAddressFromLatLng();
                        },
                        child: const Text("Anlık Konumunu Bul")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: EnabledColor)),
                      child: TextField(
                        controller: _adres_baslik,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            iconColor: Colors.white,
                            border: InputBorder.none,
                            hintText: "Adres Başlıgını Giriniz",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 120,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: EnabledColor)),
                      child: TextField(
                        minLines: 1,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        controller: _adres_detay,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            iconColor: Colors.white,
                            border: InputBorder.none,
                            hintText:
                                "Konumuzunu İsterseniz Haritadan Seçin  \n İsterseniz Kendiniz Yazın",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Button2(() {
                    if (_adres_detay == null) {
                      print("Gönderme başarısız");
                    } else {
                      addDbLocation(_adres_baslik.text, _adres_detay.text);
                      Navigator.pop(context);
                    }
                  }, "Kayıt Et")
                ],
              ))
        ],
      ),
    );
  }
}
