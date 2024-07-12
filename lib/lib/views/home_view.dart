import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/lib/views/searchView.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../cubits/get_weather_cubit/get_weather_states.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Searchview();
                }));
              },
              icon: Icon(
                Icons.search,
              ))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, State) {
          if (State is initialState) {
            return NoWeatherBody();
          } else if (State is WeatherLoadedState) {
            return WeatherInfoBody();
          } else {
            return Text('oops there was an error');
          }
        },
      ),
    );
  }
}
