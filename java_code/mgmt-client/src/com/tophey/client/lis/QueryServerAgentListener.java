/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tophey.client.lis;


import com.tophey.common.PageResult;
import com.tophey.common.ServerInfoDetail;
import com.tophey.model.Category;
import java.util.List;

/**
 *
 * @author fxcn
 */
public interface  QueryServerAgentListener {

    
    
    public void onStart(String sid);
    
    public void onSuccess(String sid,PageResult<ServerInfoDetail> allCate);
    
    public void onFailed(String sid,int errCode,String errMsg);

    
    
}
