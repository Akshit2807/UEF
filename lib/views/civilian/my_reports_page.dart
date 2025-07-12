// views/civilian/my_reports_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:io';
import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import 'report_issue_page.dart'; // Import to access ReportManager

class MyReportsPage extends StatefulWidget {
  const MyReportsPage({Key? key}) : super(key: key);

  @override
  State<MyReportsPage> createState() => _MyReportsPageState();
}

class _MyReportsPageState extends State<MyReportsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> _allReports = [];

  // Sample default reports (you can remove these if you want only user-submitted reports)
  final List<Map<String, dynamic>> _defaultReports = [
    {
      'id': '#UR001',
      'title': 'Pothole on MG Road',
      'category': 'Road Damage',
      'location': 'MG Road, Bhopal',
      'date': '2 hours ago',
      'status': 'In Progress',
      'statusColor': AppColors.warning,
      'priority': 'High',
      'description': 'Large pothole causing traffic issues',
      'assignedTo': 'Municipal Corporation',
      'estimatedTime': '3-5 days',
      'submittedAt': DateTime.now().subtract(Duration(hours: 2)).toIso8601String(),
    },
    {
      'id': '#UR002',
      'title': 'Garbage Overflow',
      'category': 'Waste Management',
      'location': 'Sector 15, Indore',
      'date': 'Yesterday',
      'status': 'Resolved',
      'statusColor': AppColors.success,
      'priority': 'Medium',
      'description': 'Garbage bin overflowing on street corner',
      'assignedTo': 'CleanMax NGO',
      'estimatedTime': 'Completed',
      'submittedAt': DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadReports();
  }

  void _loadReports() {
    setState(() {
      // Combine default reports with user-submitted reports
      _allReports = [
        ...ReportManager.getReports(),
        ..._defaultReports,
      ];
      // Sort by submission time (newest first)
      _allReports.sort((a, b) {
        DateTime timeA = DateTime.parse(a['submittedAt'] ?? DateTime.now().toIso8601String());
        DateTime timeB = DateTime.parse(b['submittedAt'] ?? DateTime.now().toIso8601String());
        return timeB.compareTo(timeA);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _getTimeAgo(String? dateString) {
    if (dateString == null) return 'Unknown';

    try {
      DateTime submittedTime = DateTime.parse(dateString);
      Duration difference = DateTime.now().difference(submittedTime);

      if (difference.inMinutes < 1) {
        return 'Just now';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes} minutes ago';
      } else if (difference.inHours < 24) {
        return '${difference.inHours} hours ago';
      } else if (difference.inDays < 7) {
        return '${difference.inDays} days ago';
      } else {
        return '${(difference.inDays / 7).floor()} weeks ago';
      }
    } catch (e) {
      return dateString;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'My Reports',
          style: AppTextStyles.heading2.copyWith(color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh_rounded,
              color: AppColors.textPrimary,
            ),
            onPressed: () {
              _loadReports();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Reports refreshed'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textTertiary,
          indicatorColor: AppColors.primary,
          labelStyle: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
          tabs: [
            Tab(text: 'All (${_allReports.length})'),
            Tab(text: 'In Progress (${_allReports.where((r) => r['status'] == 'In Progress' || r['status'] == 'Submitted').length})'),
            Tab(text: 'Resolved (${_allReports.where((r) => r['status'] == 'Resolved').length})'),
            Tab(text: 'Under Review (${_allReports.where((r) => r['status'] == 'Under Review').length})'),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildReportsList(_allReports),
            _buildReportsList(_allReports.where((r) => r['status'] == 'In Progress' || r['status'] == 'Submitted').toList()),
            _buildReportsList(_allReports.where((r) => r['status'] == 'Resolved').toList()),
            _buildReportsList(_allReports.where((r) => r['status'] == 'Under Review').toList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ReportIssuePage(),
            ),
          );
          // Refresh reports if a new report was submitted
          if (result == true) {
            _loadReports();
          }
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(
          Icons.add_a_photo_rounded,
          color: Colors.white,
        ),
        label: Text(
          'New Report',
          style: AppTextStyles.button.copyWith(fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildReportsList(List<Map<String, dynamic>> reports) {
    if (reports.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 80,
              color: AppColors.textTertiary.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No reports found',
              style: AppTextStyles.subtitle1.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your first report to get started',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        _loadReports();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = Map<String, dynamic>.from(reports[index]);
          // Update the date field with calculated time ago
          report['date'] = _getTimeAgo(report['submittedAt']);
          return _buildReportCard(report, index);
        },
      ),
    );
  }

  Widget _buildReportCard(Map<String, dynamic> report, int index) {
    final bool isNewReport = report['status'] == 'Submitted';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isNewReport
              ? AppColors.primary.withOpacity(0.5)
              : AppColors.primary.withOpacity(0.2),
          width: isNewReport ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isNewReport
                ? AppColors.primary.withOpacity(0.2)
                : Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => _showReportDetails(report),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: (report['statusColor'] as Color).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        report['status'],
                        style: AppTextStyles.caption.copyWith(
                          color: report['statusColor'] as Color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (isNewReport) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.accent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'NEW',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                    const Spacer(),
                    Text(
                      report['id'],
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textTertiary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  report['title'],
                  style: AppTextStyles.subtitle1.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      size: 16,
                      color: AppColors.textTertiary,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        report['location'],
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.access_time_rounded,
                      size: 16,
                      color: AppColors.textTertiary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      report['date'],
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        report['category'],
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getPriorityColor(report['priority']).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${report['priority']} Priority',
                        style: AppTextStyles.caption.copyWith(
                          color: _getPriorityColor(report['priority']),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                // Show image preview if available
                if (report['imagePath'] != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.surfaceVariant,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: File(report['imagePath']).existsSync()
                          ? Image.file(
                        File(report['imagePath']),
                        fit: BoxFit.cover,
                      )
                          : Container(
                        decoration: BoxDecoration(
                          color: AppColors.surfaceVariant,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image_outlined,
                            color: AppColors.textTertiary,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    ).animate()
        .fadeIn(delay: Duration(milliseconds: index * 200), duration: 600.ms)
        .slideX(begin: 0.3, end: 0, delay: Duration(milliseconds: index * 200), duration: 600.ms);
  }

  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return AppColors.error;
      case 'medium':
        return AppColors.warning;
      case 'low':
        return AppColors.info;
      default:
        return AppColors.textTertiary;
    }
  }

  void _showReportDetails(Map<String, dynamic> report) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.2),
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Handle bar
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.textTertiary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Header
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            report['title'],
                            style: AppTextStyles.heading3.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: (report['statusColor'] as Color).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            report['status'],
                            style: AppTextStyles.caption.copyWith(
                              color: report['statusColor'] as Color,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Text(
                      report['id'],
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),

                    // Show image if available
                    if (report['imagePath'] != null) ...[
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.surfaceVariant,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: File(report['imagePath']).existsSync()
                              ? Image.file(
                            File(report['imagePath']),
                            fit: BoxFit.cover,
                          )
                              : Container(
                            decoration: BoxDecoration(
                              color: AppColors.surfaceVariant,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    color: AppColors.textTertiary,
                                    size: 48,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Image not available',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 24),

                    // Details
                    _buildDetailRow('Category', report['category']),
                    _buildDetailRow('Location', report['location']),
                    _buildDetailRow('Priority', report['priority']),
                    _buildDetailRow('Assigned To', report['assignedTo']),
                    _buildDetailRow('Estimated Time', report['estimatedTime']),
                    _buildDetailRow('Submitted', report['date']),

                    const SizedBox(height: 24),

                    Text(
                      'Description',
                      style: AppTextStyles.subtitle2.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      report['description'],
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.5),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                                // TODO: Implement track functionality
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Tracking feature coming soon!'),
                                    backgroundColor: AppColors.info,
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.track_changes_outlined,
                                color: AppColors.primary,
                              ),
                              label: Text(
                                'Track',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                                // TODO: Implement share functionality
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Share feature coming soon!'),
                                    backgroundColor: AppColors.info,
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.share_outlined,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Share',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textTertiary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}