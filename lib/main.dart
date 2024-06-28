import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:playwith_customer_app/constants.dart';
import 'package:playwith_customer_app/core/i18n/strings/i18n_strings.dart';
import 'package:playwith_customer_app/core/services/analytics_service.dart';
import 'package:playwith_customer_app/design_system/loading_view.dart';
import 'package:playwith_customer_app/design_system/splash_screen.dart';
import 'package:playwith_customer_app/firebase_options.dart';
import 'package:playwith_customer_app/screens/achievements_screen.dart';
import 'package:playwith_customer_app/screens/endless_mode_screen.dart';
import 'package:playwith_customer_app/screens/lesson_menu_screen.dart';
import 'package:playwith_customer_app/screens/menu_screen.dart';
import 'package:playwith_customer_app/screens/note_helper_menu_screen.dart';
import 'package:playwith_customer_app/screens/play_along_menu_screen.dart';
import 'package:playwith_customer_app/screens/practice_screen.dart';
import 'package:playwith_customer_app/screens/quiz_selection_screen.dart';
import 'package:playwith_customer_app/screens/random_quiz_screen.dart';
import 'package:playwith_customer_app/screens/settings_screen.dart';
import 'package:playwith_customer_app/screens/signin_screen.dart';
import 'package:playwith_customer_app/screens/speedrun_menu_screen.dart';
import 'package:playwith_customer_app/storage_reader_writer.dart';
import 'package:playwith_customer_app/theme_listener.dart';
import 'package:provider/provider.dart';

/// Runs the app after performing some checks.
void main() async {
  // Starting the app in landscape orientation
  WidgetsFlutterBinding.ensureInitialized();
  // TODO(Peu):
  MobileAds.instance.initialize();

  // TODO(Peu):
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Altere para a cor desejada
    statusBarBrightness: Brightness.dark, // Use Brightness.light para texto claro na status bar
    statusBarIconBrightness: Brightness.light, // Use Brightness.dark para ícones escuros na status bar
  ));

  I18n.load(locale: const Locale('pt_BR'));

  runApp(const SplashScreen());

  await Future.delayed(const Duration(seconds: 3));

  runApp(const SightReadingApp());
}

/// The main root of the app.
class SightReadingApp extends StatelessWidget {
  const SightReadingApp({Key? key}) : super(key: key);

  static FirebaseAnalyticsObserver navigatorObserver = AnalyticsService.observer;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    StorageReaderWriter().loadDataFromStorage();
    return ChangeNotifierProvider(
      // Changes the theme
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier themeNotifier, child) {
          return MaterialApp(
            title: appName,
            theme: themeNotifier.convertThemeToThemeData(),
            debugShowCheckedModeBanner: false,
            navigatorObservers: <NavigatorObserver>[navigatorObserver],
            initialRoute: MenuScreen.id,
            routes: {
              MenuScreen.id: (context) => const MenuScreen(),
              LessonMenuScreen.id: (context) => const LessonMenuScreen(),
              PracticeScreen.id: (context) => const PracticeScreen(),
              PlayAlongMenuScreen.id: (context) => const PlayAlongMenuScreen(),
              SpeedrunMenuScreen.id: (context) => const SpeedrunMenuScreen(),
              QuizSelectionScreen.id: (context) => const QuizSelectionScreen(),
              AchievementsScreen.id: (context) => const AchievementsScreen(),
              SettingsScreen.id: (context) => const SettingsScreen(),
              EndlessModeScreen.id: (context) => const EndlessModeScreen(),
              RandomQuizScreen.id: (context) => const RandomQuizScreen(),
              NoteHelperMenuScreen.id: (context) => const NoteHelperMenuScreen(),
            },
            // TODO(Peu):
            builder: (context, child) {
              if (isProd) {
                return child!;
              } else {
                if (kIsWeb) {
                  return FutureBuilder(
                    future: Firebase.initializeApp(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error initializing Firebase: ${snapshot.error}'));
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return StreamBuilder<User?>(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.active) {
                              User? user = snapshot.data;
                              if (user == null && !kIsWeb) {
                                // Se o usuário não estiver autenticado, redireciona para a tela de login
                                return Navigator(
                                  onGenerateRoute: (settings) {
                                    return MaterialPageRoute(
                                      builder: (context) => const SignInScreen(),
                                    );
                                  },
                                );
                              } else {
                                // Se o usuário estiver autenticado, retorna a rota original
                                return child!;
                              }
                            } else {
                              // Exibir uma tela de carregamento enquanto verifica a autenticação
                              return const LoadingView();
                            }
                          },
                        );
                      }
                      return const LoadingView();
                    },
                  );
                } else {
                  return StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        User? user = snapshot.data;
                        if (user == null && !kIsWeb) {
                          // Se o usuário não estiver autenticado, redireciona para a tela de login
                          return Navigator(
                            onGenerateRoute: (settings) {
                              return MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              );
                            },
                          );
                        } else {
                          // Se o usuário estiver autenticado, retorna a rota original
                          return child!;
                        }
                      } else {
                        // Exibir uma tela de carregamento enquanto verifica a autenticação
                        return const LoadingView();
                      }
                    },
                  );
                }
              }
            },
          );
        },
      ),
    );
  }
}
