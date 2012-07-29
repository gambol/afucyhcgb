/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tophey.client.lis;


import com.tophey.common.ServerInfoDetail;

/**
 *
 * @author fxcn
 */
public interface  DeleteServerAgentListener {

    
    
    public void onStart();
    
    public void onSuccess();
    
    public void onFailed(int errCode,String errMsg);

    
    
}
