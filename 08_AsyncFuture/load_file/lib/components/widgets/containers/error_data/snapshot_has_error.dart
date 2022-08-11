import 'package:flutter/material.dart';

class SnapshotHasError extends StatelessWidget {

  const SnapshotHasError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text('файл не найден'),
        )
      ],
    );
  }
}
