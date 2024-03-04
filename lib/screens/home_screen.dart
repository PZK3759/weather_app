import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  String getGreetings(){

    //todo: implement function

    return "Good Morning";

  }

  Widget getWeatherIcon(int weatherCode){
    switch(weatherCode){
      case >=200 && <300:
        return Image.asset('assets/1.png');
      case >=300 && <400:
        return Image.asset("assets/2.png");
      case >=500 && <600:
        return Image.asset("assets/3.png");
      case >=600 && <700:
        return Image.asset("assets/4.png");
      case >=700 && <800:
        return Image.asset("assets/5.png");
      case == 800:
        return Image.asset("assets/6.png");
      case >800 && <=804:
        return Image.asset("assets/7.png");

      default:
        return Image.asset("assets/7.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  //left
                  alignment: const AlignmentDirectional(3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff673AB7)),
                  ),
                ),
                Align(
                  //right
                  alignment: const AlignmentDirectional(-3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff673AB7)),
                  ),
                ),
                Align(
                  //middle
                  alignment: const AlignmentDirectional(0, -0.3),
                  child: Container(
                    height: 400,
                    width: 400,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff673AB7)),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle, color: Color(0xffFFAB40)),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                BlocBuilder<WeatherBloc, WeatherBlocState>(
                  builder: (context, state) {
                    if(state is WeatherBlocSuccess){
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📍 ${state.weather.areaName}',
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              getGreetings(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            getWeatherIcon(state.weather.weatherConditionCode!),
                            Center(
                                child: Text(
                                  '${state.weather.temperature!.celsius!.round()}°C',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 55,
                                      fontWeight: FontWeight.w600),
                                )),
                            Center(
                                child: Text(
                                  state.weather.weatherMain!.toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500),
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                                child: Text(
                                  'Feels Like: ${state.weather.tempFeelsLike!.celsius!.round()}°C',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300),
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Center(
                                child: Text(
                                  DateFormat('EEEE, dd MMM ·').add_jm().format(state.weather.date!),
                                  // 'Monday, 04 *  09:06Pm',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300),
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/11.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sunrise',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunrise!),
                                          // '06:30 AM',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/12.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sunset',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          DateFormat().add_jm().format(state.weather.sunset!),
                                          // '06:30 AM',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/13.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Max Temp',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "${state.weather.tempMax!.celsius!.round().toString()} °C",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/14.png',
                                      scale: 8,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Min Temp',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "${state.weather.tempMin!.celsius!.round().toString()} °C",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                    else if(state is WeatherBlocLoading){
                      return const Center(child: Text("Please Wait...", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),));
                    }
                    else if(state is WeatherBlocFailure){
                      return const Center(child: Text("No data found.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),));
                    }
                    else{
                      return const Center(child: Text("Please Wait", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),));
                    }
                  },
                )
              ],
            ),
          )),
    );
  }
}
