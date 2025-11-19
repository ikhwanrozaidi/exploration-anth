Container(
  padding: EdgeInsets.all(15),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey, width: 0.5),
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Title Row with Delete Button
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              quantity['name'] ??
                  workQuantityType.name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          // Delete Button
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: Colors.red,
              size: 20,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () async {
              // Show confirmation dialog
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Remove Quantity'),
                  content: Text(
                    'Are you sure you want to remove "${quantity['name'] ?? workQuantityType.name}"?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      child: Text('Remove'),
                    ),
                  ],
                ),
              );

              if (confirmed == true) {
                // Use the composite key (id) to remove
                final compositeKey = quantity['id'] as String;
                
                context.read<DailyReportCreateBloc>().add(
                  DailyReportCreateEvent.removeQuantityType(compositeKey),
                );

                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Quantity removed successfully'),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
        ],
      ),

      dividerConfig(),



      await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => BlocProvider.value(
      value: _dailyReportCreateBloc,
      child: QuantitySelectionPage(
        addedQuantities: [], // Not used anymore, page reads from BLoC
        quantityLists: availableQuantities,
        selectedScopeUid: selectedScopeUid,
      ),
    ),