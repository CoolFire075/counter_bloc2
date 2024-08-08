import 'package:counter_bloc2/features/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          'Counter',
          style: TextStyle(
              fontSize: 50,
              decoration: TextDecoration.underline,
              letterSpacing: 20),
        ),
        leading: const Icon(Icons.add_alert_outlined, size: 30),
        actions: const [
          Icon(Icons.account_balance_rounded, size: 30),
        ],
      ),
      body: const _ButtonsColumn(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _ButtonsRow(bloc: bloc),
    );
  }
}

class _ButtonsColumn extends StatelessWidget {
  const _ButtonsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CounterText(),
        ),
      ],
    );
  }
}

class _ButtonsRow extends StatelessWidget {
  const _ButtonsRow({
    required this.bloc,
  });

  final CounterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => bloc.add(CounterIncrementPressed()),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 50,
                color: Colors.green,
              ),
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: () => bloc.add(CounterDecrementPressed()),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.remove,
                size: 50,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      buildWhen: (prev, curr) => prev.counter != curr.counter,
      builder: (BuildContext context, state) =>
          Text(
            '${state.counter}',
            style: const TextStyle(fontSize: 50),
          ),
    );
  }
}
