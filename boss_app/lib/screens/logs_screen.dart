import 'package:flutter/material.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'System Logs & Security',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text('Export Logs'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white10),
              ),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildLogEntry(context, 'ERROR', 'Database connection timeout on Device #12', '10:45 AM', Colors.redAccent),
                  _buildLogEntry(context, 'ATTACK_WARNING', 'Multiple failed logins from IP 192.168.1.5', '10:42 AM', Colors.orangeAccent),
                  _buildLogEntry(context, 'INFO', 'Routine backup completed successfully', '09:00 AM', Colors.greenAccent),
                  _buildLogEntry(context, 'ERROR', 'Failed to fetch inventory updates', '08:15 AM', Colors.redAccent),
                  _buildLogEntry(context, 'INFO', 'Admin boss logged in', '08:00 AM', Colors.blueAccent),
                  _buildLogEntry(context, 'INFO', 'System rebooted', '07:55 AM', Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogEntry(BuildContext context, String type, String message, String time, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color),
            ),
            child: Text(
              type,
              style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          Text(
            time,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.report_problem, size: 20, color: Colors.grey),
            tooltip: 'Report to Developer',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Log reported to developer system (SuperAdmin)')),
              );
            },
          )
        ],
      ),
    );
  }
}
