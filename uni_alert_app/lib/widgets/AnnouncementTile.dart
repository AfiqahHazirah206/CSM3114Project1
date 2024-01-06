//Afiqah Hazirah Binti Osman S63609
//To represent a single announcement in the list
//It will display the title, content and timestamp of the announcement

import 'package:flutter/material.dart';
import 'package:uni_alert_app/models/AnnouncementModel.dart';
import 'package:uni_alert_app/utils/DateUtils.dart' as DateUtils;

class AnnouncementTile extends StatelessWidget {
  final AnnouncementModel announcement;
  final Function onDelete;

  AnnouncementTile({required this.announcement, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(announcement.title),
      subtitle: Text(announcement.content),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(DateUtils.DateUtils.formatDateTime(announcement.timestamp)),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Call the onDelete function with the current announcement
              onDelete(announcement);
            },
          ),
        ],
      ),
    );
  }
}
