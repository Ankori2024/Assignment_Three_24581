import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  double _firstOperand = 0;
  String _operator = '';
  bool _shouldClearDisplay = false;

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _display = '0';
        _firstOperand = 0;
        _operator = '';
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        _firstOperand = double.parse(_display);
        _operator = value;
        _shouldClearDisplay = true;
      } else if (value == '=') {
        double secondOperand = double.parse(_display);
        if (_operator == '+') {
          _display = (_firstOperand + secondOperand).toString();
        } else if (_operator == '-') {
          _display = (_firstOperand - secondOperand).toString();
        } else if (_operator == '*') {
          _display = (_firstOperand * secondOperand).toString();
        } else if (_operator == '/') {
          _display = (_firstOperand / secondOperand).toString();
        }
        _operator = '';
        _shouldClearDisplay = true;
      } else {
        if (_shouldClearDisplay) {
          _display = value;
          _shouldClearDisplay = false;
        } else {
          _display = _display == '0' ? value : _display + value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Text(
                _display,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('*'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton('C'),
                    _buildButton('0'),
                    _buildButton('='),
                    _buildButton('+'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value) {
    return ElevatedButton(
      onPressed: () => _onPressed(value),
      child: Text(
        value,
        style: TextStyle(fontSize: 24),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(80, 80),
      ),
    );
  }
}
