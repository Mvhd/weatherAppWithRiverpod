import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/providerModel.dart';

class MyWeatherHome extends StatelessWidget {
  const MyWeatherHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Consumer(builder: (context, ref, _) {
            final weather = ref.watch(weatherProvider);
            return weather.when(
              data: (data) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.cloud,size: 100,color: Colors.lightBlueAccent,),
                  Text('The weather for ${data.sys?.country?.toUpperCase()}, ${data.name?.toUpperCase()} city:',style: const TextStyle(fontSize: 22),),
                  const SizedBox(height: 10,),
                  Text('The temperature is ${data.main?.temp}'),
                  Text('The temperature Min is ${data.main?.tempMin}'),
                  Text('The temperature Max is ${data.main?.tempMax}'),
                  Text('The humidity is ${data.main?.humidity}'),
                  Text('The pressure is ${data.main?.pressure}'),
                ],
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => const Text('Failed to load weather data'),
            );
          },
          ),
        ),
      ),
    );
  }
}