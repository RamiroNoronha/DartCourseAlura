class GoodManners {
  String question;
  String kakoBot = 'KakoBot\n';
  GoodManners({required this.question});

  bool isGoodManner() {
    var questionLowCase = question.toLowerCase();
    return questionLowCase.toLowerCase().contains('obrigad') ||
        questionLowCase.toLowerCase().contains('bom dia') ||
        questionLowCase.contains('boa tarde') ||
        questionLowCase.contains('boa noite') ||
        questionLowCase.contains('oi') ||
        questionLowCase.contains('ola') ||
        questionLowCase.contains('de nada') ||
        questionLowCase.contains('tudo bem');
  }

  goodMannners() {
    var questionLowCase = question.toLowerCase();
    if (questionLowCase.contains('bom dia')) {
      print(kakoBot + 'Bom dia! Espero que esteja bem');
    } else if (questionLowCase.contains('boa tarde')) {
      print(kakoBot + 'Boa tarde! Espero que esteja bem');
    } else if (questionLowCase.contains('boa noite')) {
      print(kakoBot + 'Boa noite! Espero que esteja bem');
    } else if (questionLowCase.contains('obrigad')) {
      print(kakoBot + 'De nada! É um prazer ajudar!');
    } else if (questionLowCase.contains('oi') ||
        questionLowCase.contains('ola')) {
      print(kakoBot + 'Olá! Muito prazer');
    }
  }
}
