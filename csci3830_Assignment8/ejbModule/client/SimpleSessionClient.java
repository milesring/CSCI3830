/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import beans.SimpleSessionBeanRemote;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class SimpleSessionClient {
  public static void main(String[] args) throws Exception
  {
        // TODO code application logic here

        InitialContext ctx = null;
        try {
            ctx = new InitialContext();
            System.out.println(args.length);

            String[] myStringArray = new String[]{"this ", "is ", "my", "input"};
            if (args.length == 0) {
                args = myStringArray;
            }
			 //JBoss' default remote jndi: <ejb-name>/remote
			final String jndiName = "SimpleSessionBean/remote";
			SimpleSessionBeanRemote simpleSession = (SimpleSessionBeanRemote) ctx.lookup(jndiName);
          //  SimpleSessionBeanRemote simpleSession = (SimpleSessionBeanRemote) ctx.lookup(SimpleSessionBeanRemote.class.getName());
            for (int i = 0; i < args.length; i++) {
                String returnedString = simpleSession.getEchoString(args[i]);
                System.out.println("sent string: " + args[i]
                        + ", received string: " + returnedString);
            }
        } catch (NamingException ex) {
            Logger.getLogger(SimpleSessionClient.class.getName()).log(Level.SEVERE, null, ex);
        }
  }
}
