import 'package:flutter/material.dart';

class SnapshotHasError extends StatelessWidget {
  final Set<Object?>? error;

  const SnapshotHasError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Error: $error'),
        )
      ],
    );
  }
}
