/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tophey.client.lis;


import com.tophey.common.PageResult;
import com.tophey.model.Category;
import java.util.List;

/**
 *
 * @author fxcn
 */
public interface  QueryCategoryAgentListener {

    
    
    public void onStart();
    
    public void onSuccess(List<Category> allCate);
    
    public void onFailed(int errCode,String errMsg);

    
    
}
