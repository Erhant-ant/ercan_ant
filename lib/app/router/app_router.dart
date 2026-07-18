import 'package:ercan_ant/features/home/presentation/home_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())],
);
