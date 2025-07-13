// views/social_worker/social_worker_community_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';

class SocialWorkerCommunityPage extends StatefulWidget {
  final String category; // 'government', 'ngo', 'private'

  const SocialWorkerCommunityPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<SocialWorkerCommunityPage> createState() => _SocialWorkerCommunityPageState();
}

class _SocialWorkerCommunityPageState extends State<SocialWorkerCommunityPage> {
  final TextEditingController _postController = TextEditingController();

  // Role-specific posts based on category
  List<Map<String, dynamic>> get _posts {
    if (widget.category == 'government') {
      return _governmentPosts;
    } else if (widget.category == 'ngo') {
      return _ngoPosts;
    } else {
      return _privatePosts;
    }
  }

  final List<Map<String, dynamic>> _governmentPosts = [
    {
      'id': '1',
      'author': 'Bhopal Municipal Corporation',
      'role': 'Government',
      'avatar': '🏛️',
      'time': '1 hour ago',
      'content': 'Successfully completed road restoration project on MG Road ahead of schedule! Thanks to the coordinated efforts of our engineering team and local contractors. The new surface will improve traffic flow significantly. 🛣️',
      'likes': 45,
      'comments': 12,
      'isLiked': false,
      'tags': ['Infrastructure', 'Achievement'],
      'location': 'Bhopal',
    },
    {
      'id': '2',
      'author': 'Public Works Department MP',
      'role': 'Government',
      'avatar': '⚙️',
      'time': '3 hours ago',
      'content': 'New policy update: All civic issue reports will now be processed within 48 hours. We are implementing AI-powered prioritization to ensure urgent matters get immediate attention. Transparency reports will be published weekly. 📊',
      'likes': 89,
      'comments': 28,
      'isLiked': true,
      'tags': ['Policy', 'Innovation'],
      'location': 'Madhya Pradesh',
    },
    {
      'id': '3',
      'author': 'Smart City Mission Indore',
      'role': 'Government',
      'avatar': '🌟',
      'time': '5 hours ago',
      'content': 'Launching citizen feedback portal next week! Real-time tracking of all municipal services. Citizens can rate our response time and quality of work. Your feedback drives our improvement initiatives. 🚀',
      'likes': 67,
      'comments': 19,
      'isLiked': false,
      'tags': ['Digital', 'Citizen Service'],
      'location': 'Indore',
    },
  ];

  final List<Map<String, dynamic>> _ngoPosts = [
    {
      'id': '1',
      'author': 'Green Earth Foundation',
      'role': 'NGO',
      'avatar': '🌱',
      'time': '30 minutes ago',
      'content': 'Incredible response to our weekend cleanup drive! 200+ volunteers collected 3 tons of waste from Narmada riverbank. Special thanks to local schools and youth groups who participated with such enthusiasm! 🌍♻️',
      'likes': 134,
      'comments': 42,
      'isLiked': true,
      'tags': ['Environment', 'Community'],
      'location': 'Bhopal',
    },
    {
      'id': '2',
      'author': 'Urban Care Society',
      'role': 'NGO',
      'avatar': '🏙️',
      'time': '2 hours ago',
      'content': 'Our mobile health clinic completed 500 checkups this month in underserved areas. Partnering with government hospitals for follow-up care. Healthcare accessibility is improving through community cooperation! 🏥',
      'likes': 98,
      'comments': 23,
      'isLiked': false,
      'tags': ['Healthcare', 'Outreach'],
      'location': 'Jabalpur',
    },
    {
      'id': '3',
      'author': 'Skill Development Trust',
      'role': 'NGO',
      'avatar': '🎓',
      'time': '4 hours ago',
      'content': 'Free skill training program applications now open! Courses in plumbing, electrical work, and digital literacy. 85% of our graduates find employment within 3 months. Building self-reliant communities together! 💪',
      'likes': 76,
      'comments': 31,
      'isLiked': true,
      'tags': ['Education', 'Employment'],
      'location': 'Ujjain',
    },
  ];

  final List<Map<String, dynamic>> _privatePosts = [
    {
      'id': '1',
      'author': 'Rajesh Kumar (Plumber)',
      'role': 'Private',
      'avatar': '🔧',
      'time': '45 minutes ago',
      'content': 'Just finished installing a new water filtration system for a community of 50 families! Clean water access is fundamental. Proud to contribute to better health outcomes. Fair pricing, quality work - that\'s my promise! 💧',
      'likes': 67,
      'comments': 15,
      'isLiked': false,
      'tags': ['Water', 'Community Service'],
      'location': 'Bhopal',
    },
    {
      'id': '2',
      'author': 'TechFix Solutions',
      'role': 'Private',
      'avatar': '💻',
      'time': '2 hours ago',
      'content': 'Smart street lighting project completed in Sector 15! Motion sensors and LED technology will reduce energy consumption by 60%. Technology can make our cities more sustainable and efficient. 🌙💡',
      'likes': 91,
      'comments': 18,
      'isLiked': true,
      'tags': ['Technology', 'Sustainability'],
      'location': 'Indore',
    },
    {
      'id': '3',
      'author': 'BuildRight Contractors',
      'role': 'Private',
      'avatar': '🏗️',
      'time': '6 hours ago',
      'content': 'Road repair completed 2 days ahead of schedule! Used innovative materials that last 3x longer than traditional methods. Quality work deserves fair compensation. Grateful for the community\'s trust! 🛤️',
      'likes': 84,
      'comments': 22,
      'isLiked': false,
      'tags': ['Construction', 'Innovation'],
      'location': 'Gwalior',
    },
  ];

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  String get _categoryTitle {
    switch (widget.category) {
      case 'government':
        return 'Government Workers';
      case 'ngo':
        return 'NGO Community';
      case 'private':
        return 'Private Contractors';
      default:
        return 'Community';
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
        return Icons.forum_rounded;
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
    return SafeArea(
      child: Column(
        children: [
          _buildHeader(),
          _buildCreatePost(),
          Expanded(
            child: _buildPostsList(),
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
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${_getOnlineCount()} Online',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
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

  String _getOnlineCount() {
    switch (widget.category) {
      case 'government':
        return '89';
      case 'ngo':
        return '156';
      case 'private':
        return '234';
      default:
        return '0';
    }
  }

  String _getCategoryDescription() {
    switch (widget.category) {
      case 'government':
        return 'Share updates, coordinate with departments, and showcase public service achievements';
      case 'ngo':
        return 'Connect with fellow NGOs, share impact stories, and collaborate on community projects';
      case 'private':
        return 'Network with contractors, share project updates, and build professional reputation';
      default:
        return 'Connect and collaborate with your community';
    }
  }

  Widget _buildCreatePost() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: _categoryGradient,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    _getCategoryEmoji(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _postController,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  decoration: InputDecoration(
                    hintText: _getPostHint(),
                    hintStyle: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textTertiary,
                    ),
                    border: InputBorder.none,
                  ),
                  maxLines: 3,
                  minLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildPostOption(Icons.photo_camera_rounded, 'Photo'),
              const SizedBox(width: 16),
              _buildPostOption(Icons.location_on_rounded, 'Location'),
              const SizedBox(width: 16),
              _buildPostOption(Icons.local_offer_rounded, 'Tag'),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  gradient: _categoryGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Share',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
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

  String _getCategoryEmoji() {
    switch (widget.category) {
      case 'government':
        return '🏛️';
      case 'ngo':
        return '🌱';
      case 'private':
        return '🔧';
      default:
        return '👤';
    }
  }

  String _getPostHint() {
    switch (widget.category) {
      case 'government':
        return 'Share department updates or public service achievements...';
      case 'ngo':
        return 'Share your impact story or community initiative...';
      case 'private':
        return 'Share project updates or service offerings...';
      default:
        return 'Share your thoughts...';
    }
  }

  Widget _buildPostOption(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: AppColors.textTertiary,
          size: 18,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }

  Widget _buildPostsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        return _buildPostCard(_posts[index], index);
      },
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: _categoryGradient,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    post['avatar'],
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            post['author'],
                            style: AppTextStyles.subtitle2.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: _getRoleColor(post['role']).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            post['role'],
                            style: AppTextStyles.caption.copyWith(
                              color: _getRoleColor(post['role']),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: 12,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          post['time'],
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.location_on_rounded,
                          size: 12,
                          color: AppColors.textTertiary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          post['location'],
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz_rounded,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Content
          Text(
            post['content'],
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          // Tags
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (post['tags'] as List<String>).map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '#$tag',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          // Actions
          Row(
            children: [
              _buildActionButton(
                icon: post['isLiked'] ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                label: '${post['likes']}',
                color: post['isLiked'] ? AppColors.accent : AppColors.textTertiary,
                onTap: () {
                  setState(() {
                    post['isLiked'] = !post['isLiked'];
                    post['likes'] += post['isLiked'] ? 1 : -1;
                  });
                },
              ),
              const SizedBox(width: 24),
              _buildActionButton(
                icon: Icons.chat_bubble_outline_rounded,
                label: '${post['comments']}',
                color: AppColors.textTertiary,
                onTap: () {},
              ),
              const SizedBox(width: 24),
              _buildActionButton(
                icon: Icons.share_rounded,
                label: 'Share',
                color: AppColors.textTertiary,
                onTap: () {},
              ),
              const Spacer(),
              _buildActionButton(
                icon: Icons.bookmark_border_rounded,
                label: '',
                color: AppColors.textTertiary,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    ).animate()
        .fadeIn(delay: Duration(milliseconds: 500 + (index * 200)), duration: 600.ms)
        .slideY(begin: 0.3, end: 0, delay: Duration(milliseconds: 500 + (index * 200)), duration: 600.ms);
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 20,
          ),
          if (label.isNotEmpty) ...[
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getRoleColor(String role) {
    switch (role) {
      case 'Government':
        return AppColors.primary;
      case 'NGO':
        return AppColors.secondary;
      case 'Private':
        return AppColors.accent;
      default:
        return AppColors.textTertiary;
    }
  }
}