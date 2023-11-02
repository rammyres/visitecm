import 'package:visite_cm/modelos/ondeceb.dart';

final ondecebs = [
  OndeCeB(
    id: 'ceb1',
    nome: "Hawaii Grill",
    fotos: [
      "assets/imagens/ceb1_1.png",
      "assets/imagens/ceb1_2.png",
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
      fotos: ["assets/imagens/ceb2_1.png"],
      descricao: ["Barzinho com a melhor panelada de Campo Maior"],
      localizacao:
          "https://www.google.com/maps/place/Bar,+Churrascaria+e+Posto+de+Lavagem,+Pernambuco/@-4.8460534,-42.1762464,16z/data=!4m15!1m8!3m7!1s0x7918c37c3ce6d19:0x5c5fc14971920f5a!2sBar,+Churrascaria+e+Posto+de+Lavagem,+Pernambuco!8m2!3d-4.8461011!4d-42.176128!10e5!16s%2Fg%2F11f3qxlh9_!3m5!1s0x7918c37c3ce6d19:0x5c5fc14971920f5a!8m2!3d-4.8461011!4d-42.176128!16s%2Fg%2F11f3qxlh9_?hl=pt&entry=ttu",
      preco: Preco.barato)
];
