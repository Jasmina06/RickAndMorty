import 'package:flutter/material.dart';

class StatusDropdown extends StatelessWidget {
  final String? selectedStatus;
  final Function(String?) onStatusChanged;

  const StatusDropdown({
    required this.selectedStatus,
    required this.onStatusChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedStatus ?? 'All',
      items: ['All', 'Alive', 'Dead', 'Unknown'].map((String status) {
        return DropdownMenuItem<String>(
          value: status,
          child: Text(status),
        );
      }).toList(),
      onChanged: onStatusChanged,
    );
  }
}
