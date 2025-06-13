import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/Authentication/signupScreen.dart';
import 'package:movieapp/Screens/Authentication/accounts_screen.dart';
import 'package:movieapp/Screens/detailedpages/detailspage.dart';
import 'package:movieapp/home_Screen.dart';
import 'package:movieapp/Screens/Authentication/loginScreen.dart';
import 'package:movieapp/supabaseScreens/english.dart';
import 'package:movieapp/supabaseScreens/hindi.dart';
import 'package:movieapp/supabaseScreens/myfavorite.dart';
import 'package:movieapp/supabaseScreens/mymovies.dart';
import 'package:movieapp/supabaseScreens/search.dart';
import 'package:movieapp/supabaseScreens/telugu.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final route = GoRouter(
  initialLocation: Supabase.instance.client.auth.currentSession == null
      ? '/loginScreen'
      : '/home_Screen',
  routes: [
    GoRoute(path: '/telugu', builder: (context, state) => TeluguMovieScreen()),
    GoRoute(path: '/english', builder: (context, state) => EnglishMovieScreen()),
    GoRoute(path: '/hindi', builder: (context, state) => HindiMovieScreen()),
    GoRoute(path: '/mymovies', builder: (context, state) => MyMovies()),
    GoRoute(path: '/loginScreen', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/signupScreen', builder: (context, state) => SignupScreen()),
    GoRoute(path: '/home_Screen', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/searchInput', builder: (context, state) => SearchScreen()),
    GoRoute(path: '/myfavorite', builder: (context, state) => Myfavorite()),
    GoRoute(
      path: '/accounts_screen',
      builder: (context, state) => AccountScreen(),
    ),
    GoRoute(
      path: '/detailspage/:image/:title/:overview/:video',
      builder: (context, state) {
        final image = Uri.decodeComponent(state.pathParameters['image']!);
        final title = Uri.decodeComponent(state.pathParameters['title']!);
        final overview = Uri.decodeComponent(state.pathParameters['overview']!);
        final video = Uri.decodeComponent(state.pathParameters['video']!);

        return Detailspage(image, title, overview,video);
      },
    ),
  ],
);
