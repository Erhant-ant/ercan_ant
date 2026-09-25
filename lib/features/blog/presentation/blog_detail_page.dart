import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ercan_ant/app/theme/app_colors.dart';
import 'package:ercan_ant/app/theme/app_radius.dart';
import 'package:ercan_ant/app/theme/app_spacing.dart';
import 'package:ercan_ant/features/blog/data/blog_repository.dart';
import 'package:ercan_ant/features/blog/domain/blog_post.dart';
import 'package:ercan_ant/shared/utils/date_extensions.dart';
import 'package:ercan_ant/shared/widgets/app_footer.dart';
import 'package:ercan_ant/shared/widgets/app_navbar.dart';

class BlogDetailPage extends StatefulWidget {
  const BlogDetailPage({super.key, required this.postId});

  final String postId;

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  late final List<BlogPost> _posts;
  BlogPost? _post;

  @override
  void initState() {
    super.initState();
    _posts = const BlogRepository().getPosts();
    _post = _posts.where((p) => p.id == widget.postId).firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final navbarHeight = width >= 900 ? 72.0 : 60.0;

    if (_post == null) {
      return Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.article_outlined,
                    size: 64,
                    color: AppColors.border,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Yazı bulunamadı.',
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () => context.go('/blog'),
                    child: const Text('Yazarlara Dön'),
                  ),
                ],
              ),
            ),
            const Positioned(top: 0, left: 0, right: 0, child: AppNavbar()),
          ],
        ),
      );
    }

    final post = _post!;
    // İlgili yazılar (aynı kategoriden, kendisi hariç)
    final related = _posts
        .where((p) => p.id != post.id && p.category == post.category)
        .take(2)
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 760),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 32,
                        right: 32,
                        top: AppSpacing.huge + navbarHeight,
                        bottom: AppSpacing.huge,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Geri butonu
                          TextButton.icon(
                            onPressed: () => context.go('/blog'),
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              size: 18,
                            ),
                            label: const Text('Yazarın Defteri\'ne Dön'),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.textSecondary,
                              padding: EdgeInsets.zero,
                            ),
                          ),

                          const SizedBox(height: 36),

                          // Kategori
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: .08),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: AppColors.primary.withValues(alpha: .15),
                              ),
                            ),
                            child: Text(
                              post.category,
                              style: theme.textTheme.labelLarge?.copyWith(
                                color: AppColors.primary,
                                fontSize: 11,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),

                          const SizedBox(height: 22),

                          // Başlık
                          Text(
                            post.title,
                            style: theme.textTheme.displayLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                              height: 1.08,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Meta bilgi
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 18,
                                backgroundColor: AppColors.primary,
                                child: Icon(
                                  Icons.person_rounded,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ercan Ant',
                                    style: theme.textTheme.labelLarge?.copyWith(
                                      color: AppColors.textPrimary,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                  Text(
                                    '${post.date.toTurkishFormat()}  ·  ${post.readingMinutes} dk okuma',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 36),

                          // Ayırıcı çizgi
                          Container(height: 1, color: AppColors.border),

                          const SizedBox(height: 48),

                          // İçerik
                          ...post.content.trim().split('\n\n').map((paragraph) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 28),
                              child: Text(
                                paragraph.trim(),
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  height: 2.0,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            );
                          }),

                          const SizedBox(height: 60),

                          // İmza
                          Container(
                            padding: const EdgeInsets.all(28),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: .05),
                              borderRadius: BorderRadius.circular(AppRadius.xl),
                              border: Border.all(
                                color: AppColors.primary.withValues(alpha: .12),
                              ),
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 28,
                                  backgroundColor: AppColors.primary,
                                  child: Icon(
                                    Icons.person_rounded,
                                    size: 28,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ercan Ant',
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Yazar · Roman · Hikâye',
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: AppColors.textSecondary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                FilledButton(
                                  onPressed: () => context.go('/hakkinda'),
                                  style: FilledButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.md,
                                      ),
                                    ),
                                  ),
                                  child: const Text('Hakkında'),
                                ),
                              ],
                            ),
                          ),

                          // İlgili yazılar
                          if (related.isNotEmpty) ...[
                            const SizedBox(height: 70),
                            Text(
                              'Benzer Yazılar',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 28),
                            ...related.map(
                              (p) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: _RelatedPostTile(post: p),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
                const AppFooter(),
              ],
            ),
          ),
          const Positioned(top: 0, left: 0, right: 0, child: AppNavbar()),
        ],
      ),
    );
  }
}

class _RelatedPostTile extends StatefulWidget {
  const _RelatedPostTile({required this.post});
  final BlogPost post;

  @override
  State<_RelatedPostTile> createState() => _RelatedPostTileState();
}

class _RelatedPostTileState extends State<_RelatedPostTile> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () => context.go('/blog/${widget.post.id}'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _hover
                ? AppColors.primary.withValues(alpha: .04)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: _hover
                  ? AppColors.primary.withValues(alpha: .25)
                  : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.category,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.post.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              AnimatedSlide(
                duration: const Duration(milliseconds: 200),
                offset: Offset(_hover ? .15 : 0, 0),
                child: Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
