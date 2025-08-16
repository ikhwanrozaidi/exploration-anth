import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../domain/entities/mailbox_entity.dart';

class MailboxItem extends StatelessWidget {
  final Mailbox mailbox;

  const MailboxItem({super.key, required this.mailbox});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: mailbox.isRead ? Colors.grey.withOpacity(0.2) : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: mailbox.isRead
                        ? Colors.grey.withOpacity(0.3)
                        : Color.fromARGB(255, 77, 191, 232),

                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 25,
                    color: mailbox.isRead ? Colors.grey : boldColor,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mailbox.title,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: mailbox.isRead ? Colors.grey : Colors.black,
                        ),
                      ),
                      Text(
                        mailbox.description,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: mailbox.isRead ? Colors.grey : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'payment':
        return Colors.green;
      case 'notification':
        return Colors.orange;
      case 'alert':
        return Colors.red;
      case 'info':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
