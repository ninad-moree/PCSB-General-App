import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc/calendar_bloc.dart';

class EventListWidget extends StatelessWidget {
  const EventListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        final selectedEvents = state.events[state.selectedDate] ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: selectedEvents.length,
            itemBuilder: (context, index) {
              final event = selectedEvents[index];
              return Card(
                child: ListTile(
                  title: Text(event.title),
                  subtitle: Text(event.description),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
