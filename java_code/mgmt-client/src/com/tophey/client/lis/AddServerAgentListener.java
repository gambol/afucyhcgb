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
public interface  AddServerAgentListener {

    
    
    public void onStart();
    
    public void onSuccess(ServerInfoDetail allCate);
    
    public void onFailed(int errCode,String errMsg);

    
    
}
