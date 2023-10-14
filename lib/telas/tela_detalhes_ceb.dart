import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Importe o pacote carousel_slider
import 'package:visite_cm/modelos/ondeceb.dart';

class DetalhesCeBScreen extends StatelessWidget {
  final OndeCeB ceb;

  DetalhesCeBScreen({required this.ceb});

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
                return Image.network(
                  foto,
                  fit: BoxFit.cover,
                  height: 200.0,
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
          ],
        ),
      ),
    );
  }
}
