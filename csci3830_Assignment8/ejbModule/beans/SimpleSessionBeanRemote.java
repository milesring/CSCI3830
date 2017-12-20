/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;

import javax.ejb.Remote;


@Remote
public interface SimpleSessionBeanRemote {

    String getEchoString(String clientString);
    
}
