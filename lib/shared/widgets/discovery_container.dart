
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/shared/models/models.dart';

class DiscoveryContainer extends StatelessWidget {
  final Discovery discovery;
  final Function onTap;
  const DiscoveryContainer(
      {Key? key, required this.discovery, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              '${discovery.imageUrl}',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              Text(
                '${discovery.title}',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.calendar,
                    size: 20,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${discovery.date}',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
