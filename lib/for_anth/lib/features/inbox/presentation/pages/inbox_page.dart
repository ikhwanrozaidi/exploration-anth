// lib/features/inbox/presentation/pages/inbox_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/build_loading_indicator.dart';
import '../../../../shared/utils/theme.dart';
import '../bloc/inbox_bloc.dart';
import '../bloc/inbox_event.dart';
import '../bloc/inbox_state.dart';

class InboxPage extends StatelessWidget {
  final String? title;
  
  const InboxPage({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<InboxBloc>()..add(const LoadInbox()),
      child: const InboxView(),
    );
  }
}

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<InboxBloc, InboxState>(
        builder: (context, state) {
          if (state is InboxLoaded) {
            return _buildLoadedContent(w, h, context);
          } else if (state is InboxLoading) {
            return Center(
              child: buildLoadingIndicator(
                blur: 0,
                isCentered: true,
              ),
            );
          } else if (state is InboxError) {
            return _buildErrorContent(state.message, context);
          } else {
            return _buildErrorContent('Something went wrong', context);
          }
        },
      ),
    );
  }

  Widget _buildLoadedContent(double w, double h, BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Inbox',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: w * 0.08),
                  Text(
                    'Stay Updated!',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: w * 0.04,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: w / 1.9,
                    height: w / 2.5,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: tPrimaryColorShade2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Together We Stop Scam',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: w / 1.9,
                    height: w / 2.5,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: tPrimaryColorShade2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Secure your transactions',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Mailbox',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: w * 0.04,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildMessageItem(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItem(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Mark as read when tapped
            context.read<InboxBloc>().add(const MarkMessageAsRead('message_1'));
          },
          child: Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: tPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.mail_outline_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Enquiry! Here's Quick Update",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Lorem Ipsum is simply dummy...",
                      style: GoogleFonts.poppins(),
                    ),
                  ],
                ),
              )
            ],
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

  Widget _buildErrorContent(String message, BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) {
        return ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              constraints: BoxConstraints(minHeight: cons.maxHeight),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    context.read<InboxBloc>().add(const LoadInbox());
                  },
                  child: const Chip(
                    label: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.refresh, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Try again',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    backgroundColor: tPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}