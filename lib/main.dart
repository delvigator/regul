import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regul_test/bloc/filter_bloc.dart';

void main() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  Widget _buildBox({
    required Color color,
    required double height,
  }) =>
      ColoredBox(
        color: color,
        child: SizedBox(
          width: double.infinity,
          height: height,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final filterBloc = FilterBloc();
    final compilations = [
      [
        _buildBox(
          color: Colors.red,
          height: 200,
        ),
        _buildBox(
          color: Colors.red,
          height: 400,
        ),
        _buildBox(
          color: Colors.red,
          height: 800,
        ),
      ],
      [
        _buildBox(
          color: Colors.blue,
          height: 200,
        ),
        _buildBox(
          color: Colors.blue,
          height: 400,
        ),
        _buildBox(
          color: Colors.blue,
          height: 800,
        ),
      ],
      [
        _buildBox(
          color: Colors.green,
          height: 200,
        ),
        _buildBox(
          color: Colors.green,
          height: 400,
        ),
        _buildBox(
          color: Colors.green,
          height: 800,
        ),
      ],
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:  AppBar(title:Row(
          children: filterBloc.state.filters
              .asMap()
              .entries
              .map((filter) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                filterBloc.add(ChangeFilterEvent(filter.key));
              },
              child: Text(filter.value),
            ),
          ))
              .toList(),
        ), ),
          body: BlocProvider<FilterBloc>(
        create: (context) => filterBloc,
        child: BlocBuilder<FilterBloc, FilterState>(
          bloc: filterBloc,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Column(children: compilations[filterBloc.state.currentFilter],),
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
