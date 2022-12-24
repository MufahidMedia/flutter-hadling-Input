import 'package:flutter/material.dart';

class Tugas extends StatefulWidget {
  const Tugas({super.key});

  @override
  State<Tugas> createState() => _TugasState();
}

class _TugasState extends State<Tugas> {
  final _temperatures = <String>['Celsius', 'Reamur', 'Fahrenheit', 'kelvin'];

  final _initialTemperature = <bool>[true, false, false, false];
  final _closeTemperature = <bool>[false, true, false, false];

  var _selectedInitialTemperature = 0;
  var _selectedCloseTemperature = 1;

  var _temperature = 0.0;
  var _result = "";
  
  // Muhammad Fadli Hidayatullah - 20104088
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tugas Modul 7')),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Kalkulator Temperatur Suhu",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Suhu',
                ),
                onChanged: (value) => setState(() {
                  _temperature = double.parse(value);
                  print(_temperature);
                }),
              ),
              // Muhammad Fadli Hidayatullah - 20104088
              const SizedBox (
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text("Suhu Awal",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                        ToggleButtons(
                          color: Colors.black.withOpacity(0.60),
                          constraints: const BoxConstraints(minHeight: 40.0),
                          isSelected: _initialTemperature,
                          onPressed: (index) {
                            setState(() {
                              _selectedInitialTemperature = index;
                              for (int i = 0; i < _initialTemperature.length; i++) {
                                _initialTemperature[i] = i == index;
                              }
                            });
                          },
                          // Muhammad Fadli Hidayatullah - 20104088
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('Celsius'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('Reamur'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('Fahrenheit'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('Kelvin'),
                            ),
                          ],
                        )
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Suhu Akhir",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                        ToggleButtons(
                          color: Colors.black.withOpacity(0.60),
                          constraints: const BoxConstraints(minHeight: 40.0),
                          isSelected: _closeTemperature,
                          onPressed: (index) {
                            setState(() {
                              _selectedCloseTemperature = index;
                              for (int i = 0; i < _closeTemperature.length; i++) {
                                _closeTemperature[i] = i == index;
                              }
                            });
                          },
                          // Muhammad Fadli Hidayatullah - 20104088
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('Celsius'),
                            ),
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('Reamur'),
                             ),
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('Fahrenheit'),
                             ),
                             Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text('Kelvin'),
                             ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                // Muhammad fadli Hidayatullah - 20104088
                const SizedBox(
                  height: 16),
                ElevatedButton(
                  onPressed: () => calculateTemperatures(),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(45)),
                    child: const Text('Hitung')),
                const SizedBox(
                  height: 16),
                const Text(
                  "Hasil",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16),
                  Text(
                    _result,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        }
// Muhammad fadli Hidayatullah - 20104088
        void calculateTemperatures() {
          setState(() {
            var resultTemperature = 0.0;
            if (_selectedInitialTemperature == 0) {
              switch (_selectedCloseTemperature) {
                case 0:
                resultTemperature = _temperature;
                break;
                case 1:
                resultTemperature = (4.0 / 5.0) * _temperature;
                break;
                case 2:
                resultTemperature = ((9.0 / 5.0) * _temperature) + 32;
                break;
                case 3:
                resultTemperature = _temperature + 273;
                break;
              }
            } else if (_selectedInitialTemperature == 1) {
              switch (_selectedCloseTemperature) {
                case 0:
                resultTemperature = (5.0 / 4.0) * _temperature;
                break;
                case 1:
                resultTemperature = _temperature;
                break;
                case 2:
                resultTemperature = ((9.0 / 4.0) * _temperature) + 32;
                break;
                case 3:
                resultTemperature = ((5.0 / 4.0) * _temperature) + 273;
                break;
              }
              // Muhammad Fadli Hidayatullah - 20104088
            } else if (_selectedInitialTemperature == 2) {
              switch (_selectedCloseTemperature) {
                case 0:
                resultTemperature = (5.0 / 9.0) * (_temperature - 32);
                break;
                case 1:
                resultTemperature = ((9.0 / 4.0) * _temperature) - 32;
                break;
                case 2:
                resultTemperature = ((9.0 / 4.0) * _temperature) + 32;
                break;
                case 3:
                resultTemperature = 0;
                break;
              }
            } else if (_selectedInitialTemperature == 3) {
              switch (_selectedCloseTemperature) {
                case 0:
                resultTemperature = _temperature - 273;
                break;
                case 1:
                resultTemperature = (4.0 / 5.0) * (_temperature - 273);
                break;
                case 2:
                resultTemperature = _temperature;
                break;
                case 3:
                resultTemperature = 0;
                break;
              }
            }
            _result = "$_temperature ${_temperatures[_selectedInitialTemperature]} menjadi $resultTemperature ${_temperatures[_selectedCloseTemperature]}";
          });
        }
      }

      // Muhammad Fadli Hidayatullah - 20104088