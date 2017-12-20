package beans;

import javax.ejb.Remote;

@Remote
public interface CalculatorBeanRemote {
  public void clearIt();
  public void calculate(String operation, int value);
  public int getValue();
}