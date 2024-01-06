//Afiqah Hazirah Binti Osman S63609
//For creating the UI to display announcements

import 'package:flutter/material.dart';
import 'package:uni_alert_app/models/AnnouncementModel.dart';
import 'package:uni_alert_app/services/AnnouncementService.dart';
import 'package:uni_alert_app/widgets/AnnouncementTile.dart';
import 'package:uni_alert_app/widgets/FilterOptions.dart';

class AnnouncementScreen extends StatefulWidget {
  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final AnnouncementService announcementService = AnnouncementService();
  List<String> categories = ['All', 'Academic', 'Events', 'Emergency'];
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements & Alerts'),
      ),
      body: Column(
        children: [
          FilterOptions(
            categories: categories,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category!;
              });
            },
          ),
          Expanded(
            child: _buildAnnouncementList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddAnnouncementDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildAnnouncementList() {
    var announcements = announcementService.getAnnouncements();

    return ListView.builder(
      itemCount: announcements.length,
      itemBuilder: (context, index) {
        var currentAnnouncement = announcements[index];
        // Check if the announcement matches the selected category
        if (selectedCategory == 'All' ||
            currentAnnouncement.category == selectedCategory) {
          return AnnouncementTile(
            announcement: currentAnnouncement,
            onDelete: (AnnouncementModel announcement) {
              // Call the delete function from AnnouncementService
              announcementService.deleteAnnouncement(announcement);
              // Refresh the UI to reflect the deleted announcement
              setState(() {});
            },
          );
        } else {
          return Container(); // Return an empty container if the category doesn't match
        }
      },
    );
  }

  void _showAddAnnouncementDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    String selectedCategory = categories[0]; // Default to the first category

    // Display a dialog to add a new announcement
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Announcement'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                // Add form fields for the new announcement
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(labelText: 'Content'),
                ),
                DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: categories
                      .map<DropdownMenuItem<String>>((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Get the form values and add a new announcement
                var newAnnouncement = AnnouncementModel(
                  title: titleController.text,
                  content: contentController.text,
                  timestamp: DateTime.now(),
                  category: selectedCategory,
                );
                announcementService.addAnnouncement(newAnnouncement);

                // Close the dialog
                Navigator.of(context).pop();
                // Refresh the UI to display the newly added announcement
                setState(() {});
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
