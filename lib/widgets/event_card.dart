import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;
  final Color cardColor;
  final IconData icon;
  final Color iconColor;

  const EventCard({
    super.key,
    required this.title,
    required this.description,
    required this.cardColor,
    required this.icon,
    required this.onPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300, // Adjust the width as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.transparent, width: 2.0),
          color: cardColor,
        ),
        child: Card(
          color: Colors.amber[50],
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: InkWell(
            onTap: onPressed,
            child: Row(
              // Use a Row widget to arrange elements horizontally
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          description,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 36.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
