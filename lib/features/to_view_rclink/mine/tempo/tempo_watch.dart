body: BlocBuilder<DailyReportBloc, DailyReportState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('No daily reports loaded')),
            loading: () => const Center(child: CircularProgressIndicator()),

            // Loaded
            loaded: (reports) {
              if (reports.isEmpty) {
                return const Center(child: Text('No daily reports found'));
              }

              return RefreshIndicator(
                onRefresh: () async {
                  _loadDailyReports();
                },
                child: ListView.builder(
                  padding: ResponsiveHelper.padding(context, all: 10),
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    return DailyReportOverviewListWidget(
                      report: reports[index],
                    );
                  },
                ),
              );
            },

            // Fail to load
            failure: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message, style: const TextStyle(color: Colors.red)),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _loadDailyReports,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
      ),