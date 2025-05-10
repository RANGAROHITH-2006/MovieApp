import 'package:go_router/go_router.dart';
import 'package:movieapp/Screens/accounts_screen.dart';
import 'package:movieapp/Screens/detailspage.dart';
import 'package:movieapp/Screens/home_Screen.dart';
import 'package:movieapp/Screens/loginScreen.dart';
import 'package:movieapp/Screens/searchInput.dart';

final route = GoRouter(
  initialLocation: '/loginScreen',
  routes: [
    GoRoute(path: '/loginScreen', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/home_Screen', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/searchInput', builder: (context, state) => SearchInput()),
    GoRoute(
      path: '/accounts_screen',
      builder: (context, state) => AccountScreen(),
    ),
    GoRoute(
      path: '/detailspage/:image/:title/:overview',
      builder: (context, state) {
        final image = Uri.decodeComponent(state.pathParameters['image']!);
        final title = Uri.decodeComponent(state.pathParameters['title']!);
        final overview = Uri.decodeComponent(state.pathParameters['overview']!);

        return Detailspage(image, title, overview);
      },
    ),
  ],
);
