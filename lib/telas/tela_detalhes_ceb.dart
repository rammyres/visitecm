import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Importe o pacote carousel_slider
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:visite_cm/modelos/ondeceb.dart';
import 'package:visite_cm/componentes/imagem_auto.dart';

class DetalhesCeBScreen extends StatelessWidget {
  final OndeCeB ceb;

  const DetalhesCeBScreen({Key? key, required this.ceb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ceb.nome),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CarouselSlider(
              items: ceb.fotos.map((foto) {
                return ImagemAuto(
                  imageUrl: foto,
                  boxFit: BoxFit.cover,
                  altura: 200.0,
                );
              }).toList(),
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ceb.nome,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: ceb.descricao.map((paragrafo) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        paragrafo,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 300.00,
              // width: double.infinity,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(ceb.latitude, ceb.longitude),
                  zoom: 15.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(ceb.nome),
                    position: LatLng(ceb.latitude, ceb.longitude),
                    infoWindow: InfoWindow(title: ceb.nome),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
