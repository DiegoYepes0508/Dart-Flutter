import 'package:ejemplo/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CheckSwitchesScreen extends StatefulWidget {
  const CheckSwitchesScreen({Key? key}) : super(key: key);

  @override
  State<CheckSwitchesScreen> createState() => _CheckSwitchesScreenState();
}

class _CheckSwitchesScreenState extends State<CheckSwitchesScreen> {
  double _slider = 100;
  bool _switches = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('checkbox && switches'),
      ),
      body: Column(
        children: [
          Slider.adaptive(
              min: 50,
              max: 400,
              value: _slider,
              activeColor: AppTheme.primary,
              onChanged: _switches
                  ? (value) {
                      _slider = value;
                      setState(() {});
                    }
                  : null),
          CheckboxListTile(
              title: const Text('Desactivar slider'),
              activeColor: AppTheme.primary,
              value: _switches,
              onChanged: (value) => setState(() {
                    _switches = value ?? true;
                  })),
          SwitchListTile.adaptive(
              title: const Text('Desactivar slider'),
              activeColor: AppTheme.primary,
              value: _switches,
              onChanged: (value) => setState(() {
                    _switches = value;
                  })),
          const AboutListTile(),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                  width: _slider,
                  fit: BoxFit.contain,
                  image: const NetworkImage(
                      'https://www.megaidea.net/wp-content/uploads/2020/03/batman-clipart-3-587x1024.png')),
            ),
          )
        ],
      ),
    );
  }
}
