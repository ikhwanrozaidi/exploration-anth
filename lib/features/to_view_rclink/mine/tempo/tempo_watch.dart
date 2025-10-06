  TextColumn get workScopeData => text().nullable()();
  TextColumn get roadData => text().nullable()();
  TextColumn get equipmentsData => text().nullable()();
  TextColumn get reportQuantitiesData => text().nullable()();

            await m.addColumn(
            schema.dailyReports,
            schema.dailyReports.workScopeData,
          );
          await m.addColumn(schema.dailyReports, schema.dailyReports.roadData);
                    await m.addColumn(
            schema.dailyReports,
            schema.dailyReports.equipmentsData,
          );
                    await m.addColumn(
            schema.dailyReports,
            schema.dailyReports.reportQuantitiesData,
          );