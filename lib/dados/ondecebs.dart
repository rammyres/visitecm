import 'package:visite_cm/modelos/ondeceb.dart';

final ondecebs = [
  OndeCeB(
    id: 'ceb1',
    nome: "Hawaii Grill",
    fotos: [
      "https://img.restaurantguru.com/r9e8-exterior-Churrascaria-Hawai-2022-10-1.jpg",
      "https://lh3.googleusercontent.com/p/AF1QipMkSbHDMN3wkmiTYzToYUermlS6mg9R_w8PTXVp=s680-w680-h510",
    ],
    descricao: [
      "Hawai Grill é um restaurante localizado na orla do Açude Grande"
    ],
    localizacao:
        "https://www.google.com/maps/place/Churrascaria+Hawai/@-4.8374699,-42.1731385,15z",
    preco: Preco.caro,
  ),
  OndeCeB(
      id: "ceb2",
      nome: "O Pernambuco",
      fotos: [
        "https://i.ibb.co/xDTCMjr/Captura-de-tela-de-2023-10-15-21-39-39.png"
      ],
      descricao: ["Barzinho com a melhor panelada de Campo Maior"],
      localizacao:
          "https://www.google.com/maps/place/Bar,+Churrascaria+e+Posto+de+Lavagem,+Pernambuco/@-4.8460534,-42.1762464,16z/data=!4m15!1m8!3m7!1s0x7918c37c3ce6d19:0x5c5fc14971920f5a!2sBar,+Churrascaria+e+Posto+de+Lavagem,+Pernambuco!8m2!3d-4.8461011!4d-42.176128!10e5!16s%2Fg%2F11f3qxlh9_!3m5!1s0x7918c37c3ce6d19:0x5c5fc14971920f5a!8m2!3d-4.8461011!4d-42.176128!16s%2Fg%2F11f3qxlh9_?hl=pt&entry=ttu",
      preco: Preco.barato)
];
