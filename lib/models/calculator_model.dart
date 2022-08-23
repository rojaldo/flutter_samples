const INIT = 0;
const FIRSTFIGURE = 1;
const SECONDFIGURE = 2;
const RESULT = 3;

class CalculatorModel {
  String _display = '';
  int currentState = INIT;
  num firstFigure = 0;
  int secondFigure = 0;
  String operation = '';
  num result = 0;
  CalculatorModel();

  String processNumber(int digit) {
    switch (currentState) {
      case INIT:
        firstFigure = digit;
        currentState = FIRSTFIGURE;
        _display += digit.toString();
        break;
      case FIRSTFIGURE:
        firstFigure = firstFigure * 10 + digit;
        _display += digit.toString();
        break;
      case SECONDFIGURE:
        secondFigure = secondFigure * 10 + digit;
        _display += digit.toString();
        break;
      case RESULT:
        firstFigure = digit;
        secondFigure = 0;
        result = 0;
        operation = '';
        currentState = FIRSTFIGURE;
        _display = digit.toString();
        break;
      default:
    }
    return _display;
  }

  num _resolve() {
    switch (operation) {
      case '+':
        result = firstFigure + secondFigure;
        break;
      case '-':
        result = firstFigure - secondFigure;
        break;
      case '*':
        result = firstFigure * secondFigure;
        break;
      case '/':
        result = firstFigure / secondFigure;
        break;
      default:
    }
    return result;
  }

  String processSymbol(String symbol) {
    switch (currentState) {
      case INIT:
        break;
      case FIRSTFIGURE:
        if (symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/') {
          operation = symbol;
          currentState = SECONDFIGURE;
          _display += symbol;
        }
        break;
      case SECONDFIGURE:
        if (symbol == '=') {
          result = _resolve();
          currentState = RESULT;
          _display = _display + symbol + result.toString();
        }
        break;
      case RESULT:
        if (symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/') {
          firstFigure = result;
          secondFigure = 0;
          operation = symbol;
          currentState = SECONDFIGURE;
          _display = firstFigure.toString() + symbol;
        }
        break;

      default:
    }
    return _display;
  }

  void clearCalculator() {
    firstFigure = 0;
    secondFigure = 0;
    result = 0;
    operation = '';
    currentState = INIT;
  }
}
