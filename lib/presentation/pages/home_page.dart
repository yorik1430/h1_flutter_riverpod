import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/presentation/manager/counter_view_model.dart';
import 'package:h1_flutter_riverpod/presentation/widgets/counter_widget.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Provider Page'),
      ),
      body: showEven(ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(viewModelProvider.notifier).onFabPressed();
        },
        child: Icon(Icons.add),
      ),
    );
  }


  @override
  Widget showEven(WidgetRef ref) {
    //final state = ref.watch(viewModelProvider);
    final counter = buildCount(ref);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Count: $counter'),
          CounterIsEven(),
          EvenCounter(),
        ],
      ),
    );
  }

  @override
  Widget showOdd(WidgetRef ref) {
    final counter = buildCount(ref);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterIsEven(),
          EvenCounter(),
          Text('Count: $counter'),
        ],
      ),
    );
  }

  buildCount(WidgetRef ref) =>
      ref.watch(viewModelProvider.select((value) => value.counter.count));
}
