class TransactionBoardPage extends StatelessWidget {
  const TransactionBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TransactionboardBloc>()
            ..add(const TransactionboardEvent.loadTransactionboard()),
      child: const TransactionBoardView(),
    );
  }
}

class TransactionBoardView extends StatelessWidget {
  const TransactionBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Material(
      color: backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            // ... header with Transaction title and Create Order button
            Expanded(
              child: BlocBuilder<TransactionboardBloc, TransactionboardState>(
                builder: (context, state) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<TransactionboardBloc>().add(
                        const TransactionboardEvent.refreshTransactionboard(),
                      );
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      child: _buildContent(context, state, w),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ... rest stays the same
}
