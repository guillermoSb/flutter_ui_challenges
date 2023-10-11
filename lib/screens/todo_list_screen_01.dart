import 'package:flutter/material.dart';
import 'package:ui_challenges/datetime_string.dart';

class TodoListScreen01 extends StatelessWidget {
  const TodoListScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const TodoListHeader(),
            const SizedBox(
              height: 24,
            ),
            const TodoFilterBar(),
            const SizedBox(
              height: 24,
            ),
            Expanded(
                child: ListView(
              children: [
                TodoCard(
                  title: 'Client Review & Feedback',
                  subTitle: 'Crypto Wallet Redesign',
                  completed: true,
                  startDate: DateTime.now(),
                ),
                const SizedBox(
                  height: 24,
                ),
                TodoCard(
                  title: 'Create Wireframe',
                  subTitle: 'Crypto Wallet Redesign',
                  completed: false,
                  startDate: DateTime.now(),
                ),
                const SizedBox(
                  height: 24,
                ),
                TodoCard(
                  title: 'Review With Client',
                  subTitle: 'Crypto Wallet Redesign',
                  completed: false,
                  startDate: DateTime.now(),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class TodoCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final bool completed;
  final DateTime startDate;

  const TodoCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.completed,
    required this.startDate,
  });

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _selected = false;

  @override
  void initState() {
    setState(() {
      _selected = widget.completed;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black54.withOpacity(0.1),
              blurRadius: 40,
              offset: const Offset(0, -4)),
        ],
      ),
      // color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: textTheme.titleLarge?.copyWith(
                        decoration: _selected
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.subTitle,
                      style:
                          textTheme.titleSmall?.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selected = !_selected;
                    });
                  },
                  child: _selected
                      ? Icon(
                          Icons.check_circle,
                          color: colors.secondary,
                          size: 28,
                        )
                      : const Icon(
                          Icons.circle_outlined,
                          color: Colors.black54,
                          size: 28,
                        ),
                )
              ],
            ),
            // Divider
            const Divider(
              color: Colors.black12,
            ),
            Row(
              children: [
                Text(
                  widget.startDate.dayString,
                  style: textTheme.bodyMedium?.copyWith(color: Colors.black38),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.startDate.hourString,
                  style: textTheme.bodyMedium?.copyWith(color: Colors.black26),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TodoFilterBar extends StatelessWidget {
  const TodoFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TodoFilterChip(
          isSelected: true,
          label: 'All',
          quantity: 35,
        ),
        Container(
          width: 1,
          height: 24,
          color: Colors.black12,
        ),
        const TodoFilterChip(
          isSelected: false,
          label: 'Open',
          quantity: 14,
        ),
        const TodoFilterChip(
          isSelected: false,
          label: 'Closed',
          quantity: 19,
        ),
        const TodoFilterChip(
          isSelected: false,
          label: 'Archived',
          quantity: 2,
        )
      ],
    );
  }
}

class TodoFilterChip extends StatelessWidget {
  final bool isSelected;
  final String label;
  final int quantity;

  const TodoFilterChip(
      {required this.isSelected,
      required this.label,
      required this.quantity,
      super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(
          label,
          style:
              TextStyle(color: isSelected ? colors.secondary : Colors.black38),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: isSelected ? colors.secondary : Colors.black38,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              child: Text('$quantity',
                  style: textTheme.labelSmall?.copyWith(
                    color: isSelected ? colors.onSecondary : Colors.white,
                  )),
            ),
          ),
        )
      ],
    );
  }
}

class TodoListHeader extends StatelessWidget {
  const TodoListHeader({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        // Title
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Tasks',
              style: textTheme.headlineSmall,
            ),
            Text(
              'Tuesday, 10 Oct',
              style: textTheme.bodySmall?.copyWith(
                color: Colors.black38,
              ),
            )
          ],
        ),
        const Spacer(),
        // Button
        Material(
          color: colors.primaryContainer.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            customBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Row(
                children: [
                  Icon(
                    Icons.add_rounded,
                    color: colors.primary,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'New Task',
                    style: TextStyle(color: colors.primary),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
