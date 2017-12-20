package beans;

import javax.ejb.Stateful;

@Stateful
public class CalculatorBean implements CalculatorBeanRemote {
  private int _value = 0;
  public void clearIt() {
    _value = 0;
  }
  public void calculate(String operation, int value) {
    if (operation.equals("+")) {
      _value = _value + value;
      return;
    }
    if (operation.equals("-")) {
      _value = _value - value;
      return;
    }
  }
  public int getValue() {
    return _value;
  }
}