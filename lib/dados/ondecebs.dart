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
      preco: Preco.barato),
  OndeCeB(
    id: "ceb3",
    nome: "Misturinha Santo Antônio",
    fotos: [
      "assets/imagens/ceb3_1.png",
      "assets/imagens/ceb3_2.png",
      "assets/imagens/3deb5b4b-a490-41d4-8ed0-15162b014d39_1.png",
    ],
    descricao: [
      "A Misturinha Santo Antônio é um exemplo do modelo de restaurante popular comum em Campo Maior, que vende pratos de baixo custo, composto de carboidrato (normalmente maria isabel), creme de galinha e uma opção de proteina (a mistura).",
    ],
    localizacao:
        "https://www.google.com/maps/place/Misturinha+Santo+Ant%C3%B4nio/@-4.8232778,-42.1692543,15z/data=!4m2!3m1!1s0x0:0x9416ef7ebbb40ef5?sa=X&ved=2ahUKEwj7x_Lsy_SCAxXgppUCHfJYAJoQ_BJ6BAhEEAA",
    preco: Preco.ok,
  ),
  OndeCeB(
    id: "ceb4",
    nome: "Rei da Tábua",
    fotos: [
      "assets/imagens/ceb4_1.png",
      "assets/imagens/ceb4_2.png",
      "assets/imagens/ceb4_3.png",
    ],
    descricao: [
      "Localizado próximo ao Monumento do Jenipapo, o Restaurante Rei da Tábua busca propiciar a experiência rural e caipira de Campo Maior. O restaurante conta com piscina, áreas cobertas locais instagramáveis para fotos e funciona para o almoço segundas quintas e sextas e de 10h as 20h nos fins de semanas."
    ],
    localizacao:
        "https://www.google.com/maps/place/Restaurante+Rei+da+T%C3%A1bua/@-4.7897269,-42.1165101,15z/?entry=ttu",
    preco: Preco.ok,
  ),
  OndeCeB(
    id: "ceb5",
    nome: "Ecosítio Carnaúba",
    fotos: [
      "assets/imagens/ceb5_1.png",
      "assets/imagens/ceb5_2.png",
      "assets/imagens/ceb5_3.png",
    ],
    descricao: [
      "Localizado no Pé da Serra, o Ecosítio Carnaúba se integra a paisagem, aproveitando as piscinas naturais e a beleza da Serra.",
      "Funciona exclusivamente nos fins de semana e feriados, de 8:30 às 18:30",
    ],
    localizacao:
        "https://www.google.com/maps/place/Eco+S%C3%ADtio+Carna%C3%BAba/@-4.9463627,-42.2019737,17.17z/data=!4m6!3m5!1s0x79193a6d1de398b:0x4785f5ec9fe29513!8m2!3d-4.9440625!4d-42.2010625!16s%2Fg%2F11r_4tz1yg?entry=ttu",
    preco: Preco.caro,
  ),
  OndeCeB(
    id: "ceb6",
    nome: "Bar do Vicente - Corredores",
    fotos: [
      "assets/imagens/ceb6_1.png",
      "assets/imagens/ceb5_2.png",
      "assets/imagens/ceb5_3.png",
    ],
    descricao: [
      "O Bar é um dos poucos remanscentes do completo de restaurantes e bares da Barragem Corredores.",
      "Funciona exclusivamente nos fins de semana e feriados",
    ],
    localizacao:
        "https://www.google.com.br/maps/place/Bar+do+Vicente/@-5.1041816,-42.0393271,15z/",
    preco: Preco.ok,
  )
];
