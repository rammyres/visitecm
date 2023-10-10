import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Importe o pacote carousel_slider
import '../modelos/atracao.dart';

class DetalhesAtracaoScreen extends StatelessWidget {
  final Atracao atracao;

  const DetalhesAtracaoScreen({Key? key, required this.atracao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(atracao.nome),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: atracao.fotos.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                // Use as imagens da lista de fotos da atração
                final String foto = atracao.fotos[index];
                return Image.network(
                  foto,
                  fit: BoxFit.cover,
                  height: 200.0,
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                atracao.nome,
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
                children: atracao.descricao.map((paragrafo) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        paragrafo,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 8.0), // Espaço entre os parágrafos
                    ],
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 300.0,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(atracao.latitude, atracao.longitude),
                  zoom: 15.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId(atracao.nome),
                    position: LatLng(atracao.latitude, atracao.longitude),
                    infoWindow: InfoWindow(title: atracao.nome),
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
