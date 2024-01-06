//Afiqah Hazirah Binti Osman S63609
//To manage the logic related to announcements

import 'package:uni_alert_app/models/AnnouncementModel.dart';

class AnnouncementService {
  List<AnnouncementModel> _announcements = [
    AnnouncementModel(
      title: 'Important Announcement',
      content: 'Final Exam Schedule for Semester 1 Session 2023/2024.',
      timestamp: DateTime.now(),
      category: 'Academic',
    ),
    AnnouncementModel(
      title: 'Emergency Alert',
      content: 'Emergency situation. Please stay indoors.',
      timestamp: DateTime.now().add(Duration(hours: 1)),
      category: 'Emergency',
    ),
    // Add more announcements as needed
  ];

  List<AnnouncementModel> getAnnouncements() {
    return List.from(_announcements);
  }

  void addAnnouncement(AnnouncementModel newAnnouncement) {
    _announcements.add(newAnnouncement);
  }

  void deleteAnnouncement(AnnouncementModel announcement) {
    _announcements.remove(announcement);
  }
}
