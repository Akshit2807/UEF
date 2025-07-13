// services/request_manager.dart
class RequestManager {
  static List<Map<String, dynamic>> _pendingRequests = [
    {
      'id': '#REQ001',
      'title': 'Major Pothole Repair on MG Road',
      'location': 'MG Road, Bhopal',
      'priority': 'High',
      'timeAgo': '30 minutes ago',
      'category': 'Road Maintenance',
      'description': 'Large pothole causing severe traffic disruption and vehicle damage. Multiple citizen complaints received.',
      'reportedBy': 'Rajesh Kumar',
      'estimatedTime': '2-3 days',
      'budget': '₹25,000',
      'urgency': 'Critical',
      'citizenReports': 12,
    },
    {
      'id': '#REQ002',
      'title': 'Street Light Installation',
      'location': 'Sector 15, New Bhopal',
      'priority': 'Medium',
      'timeAgo': '1 hour ago',
      'category': 'Infrastructure',
      'description': 'Install 8 LED street lights on newly constructed road for better visibility and safety.',
      'reportedBy': 'Municipal Engineer',
      'estimatedTime': '3-4 days',
      'budget': '₹40,000',
      'urgency': 'Standard',
      'citizenReports': 5,
    },
    {
      'id': '#REQ003',
      'title': 'Garbage Collection System Upgrade',
      'location': 'Indira Gandhi Colony',
      'priority': 'High',
      'timeAgo': '2 hours ago',
      'category': 'Waste Management',
      'description': 'Replace old garbage bins with smart bins and establish proper collection schedule.',
      'reportedBy': 'Colony Residents',
      'estimatedTime': '1 week',
      'budget': '₹1,20,000',
      'urgency': 'High',
      'citizenReports': 25,
    },
    {
      'id': '#REQ004',
      'title': 'Water Pipeline Leak Repair',
      'location': 'Arera Hills, Bhopal',
      'priority': 'Critical',
      'timeAgo': '3 hours ago',
      'category': 'Water Supply',
      'description': 'Major water leak causing road flooding and water wastage. Immediate attention required.',
      'reportedBy': 'Area Supervisor',
      'estimatedTime': '24 hours',
      'budget': '₹15,000',
      'urgency': 'Emergency',
      'citizenReports': 18,
    },
    {
      'id': '#REQ005',
      'title': 'Park Maintenance & Beautification',
      'location': 'Van Vihar Road',
      'priority': 'Low',
      'timeAgo': '5 hours ago',
      'category': 'Parks & Recreation',
      'description': 'Regular maintenance of park facilities, tree trimming, and flower bed preparation.',
      'reportedBy': 'Parks Department',
      'estimatedTime': '5-7 days',
      'budget': '₹35,000',
      'urgency': 'Standard',
      'citizenReports': 3,
    },
    {
      'id': '#REQ006',
      'title': 'Traffic Signal Malfunction',
      'location': 'MP Nagar Square',
      'priority': 'High',
      'timeAgo': '6 hours ago',
      'category': 'Traffic Management',
      'description': 'Traffic signal not working properly causing traffic jams during peak hours.',
      'reportedBy': 'Traffic Police',
      'estimatedTime': '1-2 days',
      'budget': '₹18,000',
      'urgency': 'High',
      'citizenReports': 8,
    },
    {
      'id': '#REQ007',
      'title': 'Drain Cleaning & Maintenance',
      'location': 'Old City Area',
      'priority': 'Medium',
      'timeAgo': '1 day ago',
      'category': 'Sanitation',
      'description': 'Clean clogged drains and remove accumulated waste to prevent waterlogging.',
      'reportedBy': 'Health Inspector',
      'estimatedTime': '2-3 days',
      'budget': '₹22,000',
      'urgency': 'Standard',
      'citizenReports': 7,
    },
    {
      'id': '#REQ008',
      'title': 'School Building Repair',
      'location': 'Government School, Kolar',
      'priority': 'Medium',
      'timeAgo': '1 day ago',
      'category': 'Public Buildings',
      'description': 'Repair damaged ceiling, fix broken windows, and paint classrooms before new session.',
      'reportedBy': 'School Principal',
      'estimatedTime': '1-2 weeks',
      'budget': '₹85,000',
      'urgency': 'Standard',
      'citizenReports': 1,
    },
  ];

  static List<Map<String, dynamic>> _acceptedRequests = [];

  static List<Map<String, dynamic>> get pendingRequests => _pendingRequests;
  static List<Map<String, dynamic>> get acceptedRequests => _acceptedRequests;

  static void acceptRequest(Map<String, dynamic> request) {
    _pendingRequests.remove(request);
    _acceptedRequests.add(request);
  }

  static void rejectRequest(Map<String, dynamic> request) {
    _pendingRequests.remove(request);
  }
}