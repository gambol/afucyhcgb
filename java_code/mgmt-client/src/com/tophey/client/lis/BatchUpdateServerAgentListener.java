/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tophey.client.lis;


import com.tophey.common.ServerInfoDetail;
import java.util.List;

/**
 *
 * @author fxcn
 */
public interface  BatchUpdateServerAgentListener {

    
    
    public void onStart();
    
    public void onSuccess(List<ServerInfoDetail> sids);
    
    public void onFailed(int errCode,String errMsg);

    
    
}
