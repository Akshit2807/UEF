// views/social_worker/social_worker_leaderboard_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class SocialWorkerLeaderboardPage extends StatefulWidget {
  final String category; // 'government', 'ngo', 'private'

  const SocialWorkerLeaderboardPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<SocialWorkerLeaderboardPage> createState() => _SocialWorkerLeaderboardPageState();
}

class _SocialWorkerLeaderboardPageState extends State<SocialWorkerLeaderboardPage> {
  final Map<String, List<Map<String, dynamic>>> _leaderboards = {
    'government': [
      {
        'name': 'Bhopal Municipal Corporation',
        'department': 'Public Works',
        'score': 4.9,
        'resolved': 245,
        'avgTime': '1.8 days',
        'rating': 4.9,
        'city': 'Bhopal',
        'rank': 1,
        'isCurrentUser': false,
        'monthlyTarget': 250,
        'completionRate': 98,
      },
      {
        'name': 'Indore Smart City',
        'department': 'Infrastructure',
        'score': 4.7,
        'resolved': 198,
        'avgTime': '2.1 days',
        'rating': 4.7,
        'city': 'Indore',
        'rank': 2,
        'isCurrentUser': false,
        'monthlyTarget': 200,
        'completionRate': 99,
      },
      {
        'name': 'You (PWD Jabalpur)',
        'department': 'Road Maintenance',
        'score': 4.5,
        'resolved': 156,
        'avgTime': '2.5 days',
        'rating': 4.5,
        'city': 'Jabalpur',
        'rank': 3,
        'isCurrentUser': true,
        'monthlyTarget': 160,
        'completionRate': 97.5,
      },
      {
        'name': 'Ujjain Municipal Council',
        'department': 'Sanitation',
        'score': 4.3,
        'resolved': 142,
        'avgTime': '2.8 days',
        'rating': 4.3,
        'city': 'Ujjain',
        'rank': 4,
        'isCurrentUser': false,
        'monthlyTarget': 150,
        'completionRate': 94.7,
      },
      {
        'name': 'Gwalior Corporation',
        'department': 'Water Supply',
        'score': 4.1,
        'resolved': 128,
        'avgTime': '3.2 days',
        'rating': 4.1,
        'city': 'Gwalior',
        'rank': 5,
        'isCurrentUser': false,
        'monthlyTarget': 140,
        'completionRate': 91.4,
      },
    ],
    'ngo': [
      {
        'name': 'Green Earth Foundation',
        'specialization': 'Environmental',
        'score': 4.9,
        'resolved': 189,
        'avgTime': '1.2 days',
        'rating': 4.9,
        'city': 'Bhopal',
        'rank': 1,
        'isCurrentUser': false,
        'volunteers': 45,
        'projectsActive': 8,
      },
      {
        'name': 'Urban Care Society',
        'specialization': 'Infrastructure',
        'score': 4.8,
        'resolved': 167,
        'avgTime': '1.5 days',
        'rating': 4.8,
        'city': 'Indore',
        'rank': 2,
        'isCurrentUser': false,
        'volunteers': 38,
        'projectsActive': 6,
      },
      {
        'name': 'You (Community First NGO)',
        'specialization': 'General Welfare',
        'score': 4.6,
        'resolved': 134,
        'avgTime': '1.8 days',
        'rating': 4.6,
        'city': 'Jabalpur',
        'rank': 3,
        'isCurrentUser': true,
        'volunteers': 28,
        'projectsActive': 5,
      },
      {
        'name': 'Clean City Initiative',
        'specialization': 'Sanitation',
        'score': 4.4,
        'resolved': 112,
        'avgTime': '2.1 days',
        'rating': 4.4,
        'city': 'Ujjain',
        'rank': 4,
        'isCurrentUser': false,
        'volunteers': 32,
        'projectsActive': 4,
      },
      {
        'name': 'Digital Inclusion Trust',
        'specialization': 'Technology',
        'score': 4.2,
        'resolved': 98,
        'avgTime': '2.4 days',
        'rating': 4.2,
        'city': 'Gwalior',
        'rank': 5,
        'isCurrentUser': false,
        'volunteers': 22,
        'projectsActive': 3,
      },
    ],
    'private': [
      {
        'name': 'BuildMax Solutions',
        'specialty': 'Construction',
        'score': 4.9,
        'resolved': 89,
        'avgTime': '0.8 days',
        'rating': 4.9,
        'city': 'Bhopal',
        'rank': 1,
        'isCurrentUser': false,
        'earnings': '₹2,45,000',
        'clientSatisfaction': 98,
      },
      {
        'name': 'QuickFix Services',
        'specialty': 'Maintenance',
        'score': 4.8,
        'resolved': 76,
        'avgTime': '1.1 days',
        'rating': 4.8,
        'city': 'Indore',
        'rank': 2,
        'isCurrentUser': false,
        'earnings': '₹1,98,000',
        'clientSatisfaction': 96,
      },
      {
        'name': 'You (TechRepair Pro)',
        'specialty': 'Electronics',
        'score': 4.6,
        'resolved': 64,
        'avgTime': '1.4 days',
        'rating': 4.6,
        'city': 'Jabalpur',
        'rank': 3,
        'isCurrentUser': true,
        'earnings': '₹1,56,000',
        'clientSatisfaction': 94,
      },
      {
        'name': 'CleanPro Services',
        'specialty': 'Sanitation',
        'score': 4.4,
        'resolved': 58,
        'avgTime': '1.6 days',
        'rating': 4.4,
        'city': 'Ujjain',
        'rank': 4,
        'isCurrentUser': false,
        'earnings': '₹1,34,000',
        'clientSatisfaction': 92,
      },
      {
        'name': 'ElectroFix Ltd',
        'specialty': 'Electrical',
        'score': 4.2,
        'resolved': 52,
        'avgTime': '1.9 days',
        'rating': 4.2,
        'city': 'Gwalior',
        'rank': 5,
        'isCurrentUser': false,
        'earnings': '₹1,18,000',
        'clientSatisfaction': 89,
      },
    ],
  };

  String get _categoryTitle {
    switch (widget.category) {
      case 'government':
        return 'Government Departments';
      case 'ngo':
        return 'NGO Organizations';
      case 'private':
        return 'Private Contractors';
      default:
        return 'Leaderboard';
    }
  }

  IconData get _categoryIcon {
    switch (widget.category) {
      case 'government':
        return Icons.account_balance_rounded;
      case 'ngo':
        return Icons.volunteer_activism_rounded;
      case 'private':
        return Icons.business_center_rounded;
      default:
        return Icons.emoji_events_rounded;
    }
  }

  Gradient get _categoryGradient {
    switch (widget.category) {
      case 'government':
        return AppColors.primaryGradient;
      case 'ngo':
        return AppColors.secondaryGradient;
      case 'private':
        return AppColors.accentGradient;
      default:
        return AppColors.primaryGradient;
    }
  }

  @override
  Widget build(BuildContext context) {
    final leaders = _leaderboards[widget.category]!;

    return SafeArea(
      child: Column(
        children: [
          _buildHeader(),
          _buildCurrentUserStats(leaders),
          Expanded(
            child: _buildLeaderboardList(leaders),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: _categoryGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _categoryIcon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  _categoryTitle,
                  style: AppTextStyles.heading2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.trending_up_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Live',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            _getCategoryDescription(),
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    ).animate()
        .fadeIn(duration: 600.ms)
        .slideY(begin: -0.3, end: 0, duration: 600.ms);
  }

  String _getCategoryDescription() {
    switch (widget.category) {
      case 'government':
        return 'Top performing government departments and agencies';
      case 'ngo':
        return 'Leading NGOs making the biggest community impact';
      case 'private':
        return 'Highest rated private contractors and service providers';
      default:
        return 'Top performers in your category';
    }
  }

  Widget _buildCurrentUserStats(List<Map<String, dynamic>> leaders) {
    final currentUser = leaders.firstWhere((leader) => leader['isCurrentUser'] == true);

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: _categoryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: _categoryGradient.colors.first.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '#${currentUser['rank']}',
                    style: AppTextStyles.heading3.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Position',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    Text(
                      currentUser['name'],
                      style: AppTextStyles.heading3.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.yellow.shade300,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      currentUser['rating'].toString(),
                      style: AppTextStyles.subtitle2.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _buildUserStatItem(
                  'Resolved',
                  '${currentUser['resolved']}',
                  Icons.check_circle_rounded,
                  Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildUserStatItem(
                  'Avg Time',
                  currentUser['avgTime'],
                  Icons.timer_rounded,
                  Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildUserStatItem(
                  _getCategorySpecificLabel(),
                  _getCategorySpecificValue(currentUser),
                  _getCategorySpecificIcon(),
                  Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate()
        .fadeIn(delay: 300.ms, duration: 600.ms)
        .slideY(begin: 0.3, end: 0, delay: 300.ms);
  }

  String _getCategorySpecificLabel() {
    switch (widget.category) {
      case 'government':
        return 'Target %';
      case 'ngo':
        return 'Volunteers';
      case 'private':
        return 'Earnings';
      default:
        return 'Score';
    }
  }

  String _getCategorySpecificValue(Map<String, dynamic> user) {
    switch (widget.category) {
      case 'government':
        return '${user['completionRate']}%';
      case 'ngo':
        return '${user['volunteers']}';
      case 'private':
        return user['earnings'];
      default:
        return user['score'].toString();
    }
  }

  IconData _getCategorySpecificIcon() {
    switch (widget.category) {
      case 'government':
        return Icons.track_changes_rounded;
      case 'ngo':
        return Icons.people_rounded;
      case 'private':
        return Icons.attach_money_rounded;
      default:
        return Icons.score_rounded;
    }
  }

  Widget _buildUserStatItem(String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(
          icon,
          color: color.withOpacity(0.8),
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: AppTextStyles.heading3.copyWith(
            color: color,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: color.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardList(List<Map<String, dynamic>> leaders) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: leaders.length,
      itemBuilder: (context, index) {
        final leader = leaders[index];
        return _buildLeaderCard(leader, index);
      },
    );
  }

  Widget _buildLeaderCard(Map<String, dynamic> leader, int index) {
    final rank = leader['rank'];
    final isCurrentUser = leader['isCurrentUser'] == true;

    Color rankColor = AppColors.textTertiary;
    IconData rankIcon = Icons.workspace_premium_rounded;

    if (rank == 1) {
      rankColor = const Color(0xFFFFD700); // Gold
      rankIcon = Icons.emoji_events_rounded;
    } else if (rank == 2) {
      rankColor = const Color(0xFFC0C0C0); // Silver
      rankIcon = Icons.emoji_events_outlined;
    } else if (rank == 3) {
      rankColor = const Color(0xFFCD7F32); // Bronze
      rankIcon = Icons.emoji_events_outlined;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isCurrentUser
              ? _categoryGradient.colors.first.withOpacity(0.5)
              : rank <= 3
              ? rankColor.withOpacity(0.3)
              : AppColors.textTertiary.withOpacity(0.1),
          width: isCurrentUser ? 2 : (rank <= 3 ? 2 : 1),
        ),
        boxShadow: [
          BoxShadow(
            color: isCurrentUser
                ? _categoryGradient.colors.first.withOpacity(0.2)
                : rank <= 3
                ? rankColor.withOpacity(0.2)
                : Colors.black.withOpacity(0.05),
            blurRadius: isCurrentUser || rank <= 3 ? 20 : 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Rank and Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: isCurrentUser
                      ? _categoryGradient
                      : rank <= 3
                      ? LinearGradient(
                    colors: [rankColor, rankColor.withOpacity(0.7)],
                  )
                      : LinearGradient(
                    colors: [AppColors.textTertiary, AppColors.textTertiary.withOpacity(0.7)],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      rankIcon,
                      color: Colors.white,
                      size: 24,
                    ),
                    Positioned(
                      bottom: 8,
                      child: Text(
                        '#$rank',
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Name and details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            leader['name'],
                            style: AppTextStyles.subtitle1.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (isCurrentUser)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              gradient: _categoryGradient,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'YOU',
                              style: AppTextStyles.caption.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 10,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getSubtitle(leader),
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),

              // Rating
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.warning,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      leader['rating'].toString(),
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.warning,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Stats
          Row(
            children: [
              _buildStatChip(
                '${leader['resolved']} Resolved',
                Icons.check_circle_rounded,
                AppColors.success,
              ),
              const SizedBox(width: 12),
              _buildStatChip(
                '${leader['avgTime']} Avg',
                Icons.timer_rounded,
                AppColors.info,
              ),
            ],
          ),

          if (_shouldShowExtraStats(leader)) ...[
            const SizedBox(height: 12),
            _buildExtraStats(leader),
          ],
        ],
      ),
    ).animate()
        .fadeIn(delay: Duration(milliseconds: 500 + (index * 200)), duration: 600.ms)
        .slideX(begin: 0.3, end: 0, delay: Duration(milliseconds: 500 + (index * 200)), duration: 600.ms);
  }

  String _getSubtitle(Map<String, dynamic> leader) {
    switch (widget.category) {
      case 'government':
        return '${leader['department']} • ${leader['city']}';
      case 'ngo':
        return '${leader['specialization']} • ${leader['city']}';
      case 'private':
        return '${leader['specialty']} • ${leader['city']}';
      default:
        return leader['city'];
    }
  }

  bool _shouldShowExtraStats(Map<String, dynamic> leader) {
    return widget.category != 'government' || leader['isCurrentUser'] == true;
  }

  Widget _buildExtraStats(Map<String, dynamic> leader) {
    switch (widget.category) {
      case 'government':
        return Row(
          children: [
            _buildStatChip(
              'Target: ${leader['monthlyTarget']}',
              Icons.track_changes_rounded,
              AppColors.primary,
            ),
            const SizedBox(width: 12),
            _buildStatChip(
              '${leader['completionRate']}% Complete',
              Icons.trending_up_rounded,
              AppColors.secondary,
            ),
          ],
        );
      case 'ngo':
        return Row(
          children: [
            _buildStatChip(
              '${leader['volunteers']} Volunteers',
              Icons.people_rounded,
              AppColors.secondary,
            ),
            const SizedBox(width: 12),
            _buildStatChip(
              '${leader['projectsActive']} Active',
              Icons.work_rounded,
              AppColors.primary,
            ),
          ],
        );
      case 'private':
        return Row(
          children: [
            _buildStatChip(
              leader['earnings'],
              Icons.attach_money_rounded,
              AppColors.accent,
            ),
            const SizedBox(width: 12),
            _buildStatChip(
              '${leader['clientSatisfaction']}% Satisfied',
              Icons.thumb_up_rounded,
              AppColors.success,
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStatChip(String text, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 16,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                style: AppTextStyles.caption.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}