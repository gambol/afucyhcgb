/*
 * Copyright(c) 2007-2010 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2010-11-30 15:23:51
 */
package com.tophey.client.lis;

import com.tophey.client.dao.CategoryQuerier;
import com.tophey.model.Category;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author fxcn
 */
public class QueryCategoryAgent {

    private Vector<QueryCategoryAgentListener> listeners = new Vector<QueryCategoryAgentListener>();

    protected String getThreadName() {
        return getClass().getName() + "-Thread";
    }

    public void addListener(QueryCategoryAgentListener lis) {
        listeners.add(lis);
    }

    public void removeListener(QueryCategoryAgentListener lis) {
        listeners.remove(lis);
    }

    public void removeAllListeners() {
        listeners.clear();
    }

    protected void fireOnStart() {
        for (QueryCategoryAgentListener lis : listeners) {
            lis.onStart();
        }
    }

    protected void fireOnSucceed(List<Category> allCate) {
        for (QueryCategoryAgentListener lis : listeners) {
            lis.onSuccess(allCate);
        }
    }

    protected void fireOnFailed(int errCode, String errMsg) {
        for (QueryCategoryAgentListener lis : listeners) {
            lis.onFailed(errCode, errMsg);
        }
    }

    public void startQuery() {
        new Thread(getClass().getName() + "-Thread") {

            @Override
            public void run() {
                fireOnStart();
                doQuery();
            }
        }.start();
    }

    private void doQuery() {
        try {

            List<Category> cl = new CategoryQuerier().getCategoryList();
            fireOnSucceed(cl);
        } catch (Throwable th) {
            th.printStackTrace();
            fireOnFailed(-1, "失败");
        }
    }
}
