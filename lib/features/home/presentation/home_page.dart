import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/shared/widgets/app_footer.dart';
import 'package:ercan_ant/shared/widgets/app_navbar.dart';

import 'widgets/about/about_teaser.dart';
import 'widgets/blog/blog_teaser.dart';
import 'widgets/books/books_section.dart';
import 'widgets/hero/hero_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _booksSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _handleInitialScroll());
  }

  void _handleInitialScroll() {
    final extra = GoRouterState.of(context).extra;
    if (extra == true) {
      _scrollToBooks();
    }
  }

  void scrollToBooks() => _scrollToBooks();

  void _scrollToBooks() {
    final ctx = _booksSectionKey.currentContext;
    if (ctx == null) return;
    final renderObject = ctx.findRenderObject();
    if (renderObject is! RenderBox) return;

    final width = MediaQuery.sizeOf(context).width;
    final navbarHeight = width >= 900 ? 72.0 : 60.0;
    final offset = renderObject.localToGlobal(Offset.zero);
    final targetY = _scrollController.offset + offset.dy - navbarHeight;

    _scrollController.animateTo(
      targetY.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final navbarHeight = width >= 900 ? 72.0 : 60.0;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(navbarHeight: navbarHeight),
                const AboutTeaser(),
                BooksSection(key: _booksSectionKey),
                const BlogTeaser(),
                const AppFooter(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppNavbar(onScrollToBooks: scrollToBooks),
          ),
        ],
      ),
    );
  }
}
