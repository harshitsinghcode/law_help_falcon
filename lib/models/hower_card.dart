import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;

  const HoverCard({
    Key? key,
    required this.title,
    required this.count,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: SizedBox(
        width: 150,
        child: Card(
          elevation: isHovered ? 10 : 2,
          color: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15), // Adjust the radius as needed
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  widget.icon,
                  size: 48,
                  color: widget.textColor,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: widget.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.count,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: widget.textColor,
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
