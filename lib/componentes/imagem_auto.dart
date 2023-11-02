import 'package:flutter/material.dart';

class ImagemAuto extends StatelessWidget {
  final String imageUrl;

  final double altura;
  final BoxFit boxFit;

  const ImagemAuto({
    Key? key,
    required this.imageUrl,
    required this.altura,
    required this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.startsWith('http') || imageUrl.startsWith('https')) {
      // Se a string começar com 'http' ou 'https', é uma URL
      return Image.network(
        imageUrl,
        height: altura,
        fit: boxFit,
      );
    } else {
      // Caso contrário, é um asset
      return Image.asset(
        imageUrl,
        height: altura,
        fit: boxFit,
      );
    }
  }
}
