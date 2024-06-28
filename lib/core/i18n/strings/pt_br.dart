import 'package:playwith_customer_app/core/i18n/strings/translation.dart';

class PtBr implements Translation {
  // Failures
  @override
  String get unexpectedFailure => 'Erro inesperado!';
  @override
  String get notHaveInternetConnectionFailure => 'Verifique sua conexão com a internet e tente novamente!';
  @override
  String get invalidDataFailure => 'Dados inválidos!';
  @override
  String get notFoundFailure => 'Não encontrado!';
  @override
  String get internalServerErrorFailure => 'Erro no servidor';

  // Words
  String get _question => 'Questão';
  String get _of => 'de';
  @override
  String get reload => 'Recarregue!';
  @override
  String get exitCaps => 'Sair';
  // @override
  // String get completeCaps => 'Complete';
  // @override
  // String get lesson => 'lição';
  // @override
  // String get lessons => 'lições';
  // @override
  // String get quiz => 'quiz';
  // @override
  // String get quizzes => 'quizzes';

  // MenuScreen
  @override
  String get lessonsCaps => 'Lições';
  @override
  String get practice => 'Praticar';
  @override
  String get achievements => 'Conquistas';
  @override
  String get learnMoreNotesNotification => 'Ei! Que tal aprender mais algumas notas hoje?';

  // LessonMenuScreen
  @override
  String get lesson1 => 'Lição 1';
  @override
  String get lesson2 => 'Lição 2';
  @override
  String get lesson3 => 'Lição 3';
  @override
  String get lesson4 => 'Lição 4';
  @override
  String get lesson5 => 'Lição 5';
  @override
  String get lesson6 => 'Lição 6';
  @override
  String get lesson7 => 'Lição 7';
  @override
  String get lesson8 => 'Lição 8';
  @override
  String get lesson9 => 'Lição 9';
  @override
  String get lesson10 => 'Lição 10';

  // PracticeScreen
  @override
  String get practiceYourSkills => 'Pratique suas habilidades!';
  @override
  String get playAlong => 'Toque junto';
  @override
  String get speedrun => 'Corrida contra o tempo';
  @override
  String get takeAQuiz => 'Faça um quiz';
  @override
  String get endless => 'Infinito';

  // PlayAlongMenuScreen
  @override
  String get selectTrack => 'Selecione uma faixa:';
  @override
  String get record => 'Recorde:';

  // SpeedrunMenuScreen
  @override
  String get chooseDuration => 'Escolha uma duração:';
  @override
  String get seconds => ' segundos';

  // QuizSelectionScreen
  @override
  String get chooseQuiz => 'Escolha um quiz:';
  @override
  String get randomMixedQuiz => 'Quiz misto aleatório';
  @override
  String get quiz1 => 'Quiz 1 (Lição 1)';
  @override
  String get quiz2 => 'Quiz 2 (Lição 2)';
  @override
  String get quiz3 => 'Quiz 3 (Lição 3)';
  @override
  String get quiz4 => 'Quiz 4 (Lição 4)';
  @override
  String get quiz5 => 'Quiz 5 (Lição 5)';
  @override
  String get quiz6 => 'Quiz 6 (Lição 6)';
  @override
  String get quiz7 => 'Quiz 7 (Lição 7)';
  @override
  String get quiz8 => 'Quiz 8 (Lição 8)';
  @override
  String get quiz9 => 'Quiz 9 (Lição 9)';
  @override
  String get quiz10 => 'Quiz 10 (Lição 10)';

  // AchievementsScreen
  String get achievementsTitle => 'Conquistas';
  @override
  String get toDoTab => 'A fazer';
  @override
  String get completedTab => 'Completadas';

  // SettingsScreen
  @override
  String get settingsCaps => 'Configurações';
  @override
  String get general => 'Geral';
  @override
  String get difficulty => 'Dificuldade';
  @override
  String get theme => 'Tema';
  @override
  String get extras => 'Extras';
  @override
  String get resetProgress => 'Redefinir progresso';
  @override
  String get privacyPolicy => 'Política de privacidade';
  @override
  String get warning => 'Aviso';
  @override
  String get resetConfirmation => 'Redefinir irá apagar todo o progresso e configurações.';
  @override
  String get cancel => 'Cancelar';
  @override
  String get confirm => 'Confirmar';
  @override
  String difficultyToString(String difficulty) {
    switch (difficulty) {
      case 'Beginner':
        return 'Iniciante';
      case 'Intermediate':
        return 'Intermediário';
      case 'Expert':
        return 'Especialista';
      default:
        return 'Iniciante';
    }
  }

  @override
  String themeToString(String themeMode) {
    switch (themeMode) {
      case 'Dark':
        return 'Escuro';
      case 'Light':
        return 'Claro';
      case 'Pink':
        return 'Rosa';
      default:
        return 'Escuro';
    }
  }

  // // EndlessModeScreen
  // String get startGame => 'Iniciar Jogo';
  // String get newHighScore => 'Nova Pontuação Máxima!';
  // String get stop => 'Parar';
  // String get endNotificationMessage =>
  //     'Redefinir irá apagar todo o progresso e configurações.';

  // RandomQuizScreen
  @override
  String get awwBetterLuckNextTime => 'Ah, mais sorte da próxima vez!';
  @override
  String get congratulations => 'Parabéns!';
  @override
  String get quizzesCaps => 'Quizzes';

  // NoteHelperMenuScreen
  @override
  String get noteHelper => 'Auxiliar de Notas';
  @override
  String get bassClefNotes => 'Notas na Clave de Fá';
  @override
  String get trebleClefNotes => 'Notas na Clave de Sol';
  @override
  String get noteTypes => 'Tipos de Notas';

  // AchievementsCompleted
  @override
  String get noAchievementsCompleted => 'Nenhuma conquista foi completada ainda';

  // EndlessEndingInstructions
  @override
  String get wellDone => 'Muito bem!';
  @override
  String get yourScore => 'Sua pontuação:';
  @override
  String get highScore => 'Pontuação Máxima:';
  @override
  String get playGameAgain => 'Jogar Novamente';

  // EndlessStartingInstructions
  @override
  String get endlessMode => 'Modo Infinito';
  @override
  String get endlessModeDescription => 'Acerte o máximo de perguntas que puder antes de suas vidas acabarem!';
  @override
  String get changeDifficulty => 'Altere a dificuldade nas configurações para mudar a velocidade das notas.';
  @override
  String get selectTheClef => 'Selecione a Clave';
  @override
  String get treble => 'Clave de Sol';
  @override
  String get bass => 'Clave de Fá';

  // SpeedrunMenuInstructions
  @override
  String get speedrunMode => 'Modo Speedrun';
  @override
  String get speedrunModeDescription => 'Acerte o máximo de perguntas que puder na duração escolhida!';
  @override
  String get goodLuck => 'Boa sorte!';

  // QuestionSkeleton
  @override
  String questionOfQuestions(int questionNum, int totalNumOfQuestions) {
    return '$_question $questionNum $_of $totalNumOfQuestions';
  }

  // ReviewAnswersScreen
  @override
  String questionOfUserAnswers(int questionNum, int totalNumOfUserAnswers) {
    return '$_question $questionNum $_of $totalNumOfUserAnswers';
  }

  // Quiz
  @override
  String get whatNoteIsThis => 'Qual nota é esta?';
  @override
  String get youGotCorrect => 'Correto!';
  @override
  String get youGotTheCorrectAnswer => 'Você acertou!';
  @override
  String get youGotIncorrect => 'Incorreto!';
  @override
  String get youGotWrongAnswer => 'Resposta errada, a resposta correta é ';
  @override
  String get finish => 'Finalizar';
  @override
  String get next => 'Próximo';

  // ReviewAnswersScreen
  @override
  String get reviewAnswers => 'Revisar Respostas';
  @override
  String get youDidNotAnswer => 'Você não respondeu a nenhuma pergunta';
  @override
  String get correct => 'Correto';
  @override
  String get incorrect => 'Incorreto';
  @override
  String get correctAnswer => 'Resposta Correta: ';
  @override
  String get yourAnswer => 'Sua Resposta: ';

  // inAppNotification
  @override
  String get achievementCompleted => 'Conquista completada!';
  @override
  String get continueToResults => 'Continuar para Resultados';
  @override
  String get checkAchievements => 'Ver Conquistas';

  // StorageReaderWriter
  @override
  String get youCompletedOneLesson => 'Você completou 1 aula';
  @override
  String get youCompletedFiveLessons => 'Você completou 5 aulas';
  @override
  String get youCompletedAllLessons => 'Você completou todas as aulas';
  @override
  String get youCompletedOneQuiz => 'Você completou 1 questionário';
  @override
  String get youCompletedFiveQuizzes => 'Você completou 5 questionários';
  @override
  String get youCompletedAllQuizzes => 'Você completou todos os questionários';
  @override
  String get youScoredFiftyPercentOrMore => 'Você conseguiu 50% ou mais nesta corrida contra o tempo';
  @override
  String get youScoredTenOrMoreBeginner => 'Você marcou 10 ou mais neste modo sem fim';
  @override
  String get youScoredTwentyOrMoreIntermediate => 'Você marcou 20 ou mais neste modo sem fim';
  @override
  String get youScoredThirtyOrMoreExpert => 'Você marcou 30 ou mais neste modo sem fim';
  @override
  String get youGotHundredPercentPlayAlong => 'Você conseguiu 100% nesta sessão! Bom trabalho!';
  @override
  String get betterLuckNextTime => 'Mais sorte da próxima vez!';

  // SpeedrunScreen
  @override
  String correctAnswersInSeconds(int score, int duration) {
    return '$score corretas em $duration segundos';
  }

  // PlayAlongEndingInstructions
  @override
  String get songFinished => 'Música Finalizada';
  @override
  String get youGot => 'Você conseguiu';
  @override
  String get playInstrumentAgain => 'Tocar Novamente';
  @override
  String get playAnotherSong => 'Tocar Outra Música';
  @override
  String get exit => 'Sair';

  // Questions
  @override
  String get question1 =>
      'Vamos aprender a ler notas. Todas as notas musicais estão nas linhas ou espaços do pentagrama musical. O símbolo à esquerda é chamado de clave de sol. Esta é nossa primeira nota. O nome é C (Dó). O dó central é um círculo com uma linha curta atravessando-o. Pressione C no teclado.';
  @override
  String get question2 =>
      'Esta é nossa segunda nota. O nome é D (Ré). Está diretamente abaixo da linha mais baixa. Agora pressione D no teclado.';
  @override
  String get question3 =>
      'Esta é nossa terceira nota. O nome é E (Mi). O círculo está na linha mais baixa do pentagrama de 5 linhas. Agora pressione E no teclado.';
  @override
  String get question4 =>
      'Ótimo trabalho. Agora você aprendeu as três primeiras notas. Tente responder ao resto das perguntas sem ajuda. Que nota é esta?';
  @override
  String get lesson2Introduction =>
      'Esta lição ensinará mais 2 notas. Esta nota é F (Fá). Está entre as 2 linhas mais baixas do pentagrama. Agora pressione F no teclado.';
  @override
  String get lesson2GNote =>
      'Esta nota é G (Sol). O círculo está na segunda linha mais baixa do pentagrama. Agora pressione G no teclado.';
  @override
  String get lesson2Practice =>
      'Tente responder estas perguntas por conta própria com uma combinação das notas anteriores.';
  @override
  String get lesson3Introduction =>
      'Esta lição ensinará as últimas 2 notas. Esta nota é A (Lá). Está localizada abaixo da linha do meio do pentagrama. Agora pressione A no teclado.';
  @override
  String get lesson3BNote =>
      'Esta nota é B (Si). Está localizada na linha do meio do pentagrama. Agora pressione B no teclado.';
  @override
  String get lesson3Practice =>
      'Agora você pode ler todas as notas associadas à clave de sol. Tente responder estas perguntas por conta própria com uma combinação das notas anteriores.';
  @override
  String get lesson4Introduction =>
      'O símbolo da clave mudou! Esta é a clave de fá e as notas são tocadas na parte inferior do piano. As posições das notas serão diferentes. Este é o C na clave de fá, que está abaixo da linha do meio. Agora pressione C no teclado. ** Mova o teclado para a esquerda antes de responder **.';
  @override
  String get lesson4DNote =>
      'Este nome é D (Ré) na clave de fá. Está na linha do meio do pentagrama. Agora pressione D no teclado.';
  @override
  String get lesson4ENote =>
      'Este é o E (Mi) na clave de fá. Está entre a segunda e a terceira linhas do topo do pentagrama e está acima de D. Agora pressione E no teclado.';
  @override
  String get lesson4FNote =>
      'Este é o F (Fá) na clave de fá. Está na segunda linha do topo do pentagrama. Agora pressione F no teclado.';
  @override
  String get lesson4Practice =>
      'Ótimo trabalho. Agora você aprendeu as primeiras quatro notas na clave de fá. Tente responder ao resto das perguntas sem ajuda. Que nota é esta?';
  @override
  String get lesson5Introduction =>
      '** Esta lição está na clave de fá, deslize o teclado para a esquerda primeiro. ** Vamos aprender G A B na clave de fá. Esta é a posição de G na clave de fá, que está abaixo da linha superior do pentagrama. Agora pressione G no teclado.';
  @override
  String get lesson5ANote =>
      'Este nome é A (Lá) na clave de fá. Desta vez, A é uma nota atravessada pela linha superior do pentagrama. Agora pressione A no teclado.';
  @override
  String get lesson5BNote =>
      'Este é o B (Si) na clave de fá. Está no topo da primeira linha do pentagrama. Agora pressione B no teclado.';
  @override
  String get lesson5Practice =>
      'Ótimo trabalho. Agora você aprendeu a ler as notas básicas na clave de fá. Tente responder ao resto das perguntas sem ajuda. Que nota é esta?';
  @override
  String get lesson6Introduction =>
      'Vamos ler notas mais altas na clave de sol. Quanto mais alta a nota no pentagrama de 5 linhas, mais alto é o tom. Toque B para esta nota';
  @override
  String get lesson6CNote =>
      'Observe que esta nota é mais alta que B na pergunta anterior. Mova o teclado para a direita para obter um tom alto e pressione C no teclado.';
  @override
  String get lesson6Practice =>
      'Ótimo trabalho. Todas as notas repetirão o padrão C-D-E-F-G-A-B antes de voltar para C à medida que você sobe no pentagrama musical. Você irá mais para a direita ao tocar mais alto. Que nota é esta?';
  @override
  String get lesson7Introduction =>
      'Esta é uma lição extra sobre como abaixar notas. Quanto mais baixa a nota no pentagrama de 5 linhas, mais baixo é o tom. Toque C para esta nota';
  @override
  String get lesson7BNote =>
      'Observe que esta nota é mais baixa que C na pergunta anterior. Mova o teclado para a esquerda para obter um tom baixo e pressione B no teclado.';
  @override
  String get lesson7Practice =>
      'Ótimo trabalho. Todas as notas repetirão o padrão C-B-A-G-F-E-D e voltarão para C à medida que você desce no pentagrama musical ou mais para a esquerda de um teclado/piano. Que nota é esta?';
  @override
  String get lesson8Introduction =>
      'Esta é uma lição extra sobre como ler sustenidos e bemóis. Este símbolo # é um sustenido. Você deve pressionar a tecla mais próxima à direita (na maioria das vezes é uma tecla preta). Neste caso, pressione a tecla preta ao lado do F à direita.';
  @override
  String get lesson8FlatNote =>
      'Ótimo trabalho, agora aprenda sobre bemóis. O símbolo semelhante a b é um bemol. Você deve pressionar a tecla mais próxima à esquerda. Neste caso, pressione a tecla preta à esquerda de B';
  @override
  String get lesson8Practice =>
      'Ótimo trabalho, agora tente responder a este conjunto de sustenidos e bemóis por conta própria. Pressione as teclas da mesma forma quando encontrar um bemol ou um sustenido na clave de fá.';
  @override
  String get lesson9Introduction =>
      'Esta é uma lição de resumo. Estamos revisando notas na clave de sol e adicionando algumas novas notas para desafio. Lembre-se de que você pode deslizar o teclado para a esquerda e para a direita para mudar a oitava.';
  @override
  String get lesson10Introduction =>
      'Esta é uma lição de resumo. Estamos revisando notas na clave de fá e algumas novas notas para desafio. Lembre-se de que você pode deslizar o teclado para a esquerda e para a direita para mudar a oitava. LEMBRE-SE DE DESLIZAR PARA A ESQUERDA PRIMEIRO.';

  // AchievementMaker
  @override
  String get complete1Lesson => 'Complete 1 lição';
  @override
  String get complete5Lessons => 'Complete 5 lições';
  @override
  String get completeAllLessons => 'Complete todas as lições';
  @override
  String get complete1Quiz => 'Complete 1 quiz';
  @override
  String get complete5Quizzes => 'Complete 5 quizzes';
  @override
  String get completeAllQuizzes => 'Complete todos os quizzes';
  @override
  String get endlessTrebleBeginner10 => 'Marque 10 ou mais no modo infinito (clave de sol na dificuldade iniciante)';
  @override
  String get endlessTrebleIntermediate20 =>
      'Marque 20 ou mais no modo infinito (clave de sol na dificuldade intermediária)';
  @override
  String get endlessTrebleExpert30 => 'Marque 30 ou mais no modo infinito (clave de sol na dificuldade avançada)';
  @override
  String get endlessBassBeginner10 => 'Marque 10 ou mais no modo infinito (clave de fá na dificuldade iniciante)';
  @override
  String get endlessBassIntermediate20 =>
      'Marque 20 ou mais no modo infinito (clave de fá na dificuldade intermediária)';
  @override
  String get endlessBassExpert30 => 'Marque 30 ou mais no modo infinito (clave de fá na dificuldade avançada)';
  @override
  String get speedrun10 => 'Marque 5 ou mais na corrida de 10 segundos';
  @override
  String get speedrun20 => 'Marque 10 ou mais na corrida de 20 segundos';
  @override
  String get speedrun30 => 'Marque 15 ou mais na corrida de 30 segundos';
  @override
  String get speedrun40 => 'Marque 20 ou mais na corrida de 40 segundos';
  @override
  String get speedrun50 => 'Marque 25 ou mais na corrida de 50 segundos';
  @override
  String get speedrun60 => 'Marque 30 ou mais na corrida de 60 segundos';
  @override
  String get odeToJoyBeginner => 'Complete Ode to Joy no modo iniciante';
  @override
  String get odeToJoyIntermediate => 'Complete Ode to Joy no modo intermediário';
  @override
  String get odeToJoyExpert => 'Complete Ode to Joy no modo avançado';
  @override
  String get simpleBassMelodyBeginner => 'Complete Melodia simples de baixo no modo iniciante';
  @override
  String get simpleBassMelodyIntermediate => 'Complete Melodia simples de baixo no modo intermediário';
  @override
  String get simpleBassMelodyExpert => 'Complete Melodia simples de baixo no modo avançado';
  @override
  String get oldMacdonaldBeginner => 'Complete Old Macdonald no modo iniciante';
  @override
  String get oldMacdonaldIntermediate => 'Complete Old Macdonald no modo intermediário';
  @override
  String get oldMacdonaldExpert => 'Complete Old Macdonald no modo avançado';
  @override
  String get fadedBeginner => 'Complete Faded - Alan Walker no modo iniciante';
  @override
  String get fadedIntermediate => 'Complete Faded - Alan Walker no modo intermediário';
  @override
  String get fadedExpert => 'Complete Faded - Alan Walker no modo avançado';
  @override
  String get swayingMelodyBeginner => 'Complete Melodia oscilante no modo iniciante';
  @override
  String get swayingMelodyIntermediate => 'Complete Melodia oscilante no modo intermediário';
  @override
  String get swayingMelodyExpert => 'Complete Melodia oscilante no modo avançado';
}
