import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../modelos/atracao.dart';

class DetalhesAtracaoScreen extends StatelessWidget {
  final Atracao atracao;

  DetalhesAtracaoScreen({required this.atracao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Atração'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              atracao.foto,
              fit: BoxFit.cover,
              height: 200.0,
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
              child: Text(
                atracao.descricao.join('\n'),
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            // Adicione aqui o widget do Google Maps com a localização da atração
            Container(
              height: 300.0, // Defina a altura do mapa conforme necessário
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
