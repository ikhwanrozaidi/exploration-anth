// lib/features/inbox/presentation/widgets/message_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/utils/theme.dart';

class MessageItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? timestamp;
  final bool isRead;
  final VoidCallback? onTap;
  final IconData? icon;

  const MessageItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.timestamp,
    this.isRead = false,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: isRead ? Colors.grey.shade400 : tPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      icon ?? Icons.mail_outline_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: GoogleFonts.poppins(
                                fontWeight: isRead ? FontWeight.w400 : FontWeight.w500,
                                color: isRead ? Colors.grey.shade600 : Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (timestamp != null)
                            Text(
                              timestamp!,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: isRead ? Colors.grey.shade500 : Colors.grey.shade700,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Divider(
          thickness: 1,
          color: Colors.grey.shade300,
        )
      ],
    );
  }
}

// lib/features/inbox/presentation/widgets/promotion_card.dart
class PromotionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imagePath;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const PromotionCard({
    super.key,
    required this.title,
    this.subtitle,
    this.imagePath,
    this.backgroundColor,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? w / 1.9,
        height: height ?? w / 2.5,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: backgroundColor ?? tPrimaryColorShade2,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (imagePath != null)
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imagePath!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// lib/features/inbox/presentation/widgets/inbox_header.dart
class InboxHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onNotificationTap;
  final int? unreadCount;

  const InboxHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onNotificationTap,
    this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              if (onNotificationTap != null)
                GestureDetector(
                  onTap: onNotificationTap,
                  child: Stack(
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        size: 24,
                      ),
                      if (unreadCount != null && unreadCount! > 0)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              unreadCount! > 99 ? '99+' : unreadCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
          SizedBox(height: w * 0.08),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: w * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}