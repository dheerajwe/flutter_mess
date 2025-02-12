import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For DateFormat

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get current date and day
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String currentDay = DateFormat('EEEE').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove default back button
        title: Row(
          children: [
            // Profile Icon (left side)
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/adminprofile'); // Navigate to Profile Page
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20, // Profile icon size
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue[800]!, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            // Centered text with greeting, date, and day
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Hi Dheeraj",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800], // Dark blue color
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "$currentDay, $currentDate", // Show day and date only
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Light blue color
                    ),
                  ),
                ],
              ),
            ),
            // Notification Icon (right side)
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.blue[800]),
              onPressed: () {
                Navigator.pushNamed(context,
                    '/notification'); // Navigate to Notifications Page
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Manage complaints and mess operations',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Complaint Management",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1234A4),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildStatusCard(
                        "Active Complaints", "24", Colors.green),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child:
                        _buildStatusCard("Pending Reviews", "12", Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Recent Complaints",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  _buildComplaintCard("#12345", "Food Quality Issue",
                      "John Doe", "In Progress", Colors.orange),
                  _buildComplaintCard("#12346", "Hygiene Concern", "Jane Smith",
                      "Pending", Colors.red),
                  _buildComplaintCard("#12347", "Portion Size", "Mike Johnson",
                      "Resolved", Colors.green),
                ],
              ),
              SizedBox(height: 20),
              // Track Your Complaint Section
              Text(
                "Track Your Complaint",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1434A4),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              color: Colors.grey, width: 1), // Normal border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              color: Colors.blueAccent,
                              width: 2.0), // Focused border
                        ),
                        labelText: "Enter Complaint ID",
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1434A4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Track", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // New Complaint Status Section
              Column(
                children: [
                  _buildComplaintCard("#12345", "Food Quality Issue",
                      "John Doe", "In Progress", Colors.orange),
                ],
              ),
              //
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: Color(0xFF9CA3AF)),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report, color: Color(0xFF143A4A)),
            label: "Complaints",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Color(0xFF143A4A)),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: Color(0xFF143A4A)),
            label: "Staff",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Color(0xFF143A4A)),
            label: "Settings",
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/adminhome');
              break;
            case 1:
              // Navigate to meals page (you can create this page)
              Navigator.pushNamed(context, '/complaints');
              break;
            case 2:
              Navigator.pushNamed(context, '/adminmenu');
              break;
            case 3:
              Navigator.pushNamed(context, '/messmanagement');
              break;
            case 4:
              Navigator.pushNamed(context, '/adminsettings');
              break;
          }
        },
      ),
    );
  }

  Widget _buildStatusCard(String title, String count, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildComplaintCard(String id, String issue, String submittedBy,
      String status, Color statusColor) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.report, color: Color(0xFF143A4A)),
        title: Text(id),
        subtitle: Text("$issue\nSubmitted by: $submittedBy"),
        trailing: Chip(
          label: Text(status),
          backgroundColor: statusColor,
        ),
      ),
    );
  }
}
