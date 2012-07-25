/*
 * Copyright(c) 2007-2010 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2010-11-30 15:23:51
 */
package com.tophey.client.lis;

import com.tophey.client.dao.ServerQuerier;
import com.tophey.common.PageResult;
import com.tophey.common.ServerInfoDetail;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author fxcn
 */
public class QueryServerAgent {

    private Vector<QueryServerAgentListener> listeners = new Vector<QueryServerAgentListener>();

    protected String getThreadName() {
        return getClass().getName() + "-Thread";
    }

    public void addListener(QueryServerAgentListener lis) {
        listeners.add(lis);
    }

    public void removeListener(QueryServerAgentListener lis) {
        listeners.remove(lis);
    }

    public void removeAllListeners() {
        listeners.clear();
    }

    protected void fireOnStart() {
        for (QueryServerAgentListener lis : listeners) {
            lis.onStart();
        }
    }

    protected void fireOnSucceed(PageResult<ServerInfoDetail> allCate) {
        for (QueryServerAgentListener lis : listeners) {
            lis.onSuccess(allCate);
        }
    }

    protected void fireOnFailed(int errCode, String errMsg) {
        for (QueryServerAgentListener lis : listeners) {
            lis.onFailed(errCode, errMsg);
        }
    }

    public void startQuery(final String categoryId, final int start, final int size) {
        new Thread(getClass().getName() + "-Thread") {

            @Override
            public void run() {
                fireOnStart();
                doQuery(categoryId, start, size);
            }
        }.start();
    }

    private void doQuery(String categoryId, int start, int size) {
        try {

            int count = new ServerQuerier().getServerCountByCategory(categoryId);
            List<ServerInfoDetail> cl = new ServerQuerier().getServerInfoDetailPageByCategory(categoryId, start, size);
            fireOnSucceed(new PageResult(count, (start + 1) / size, size, cl));
        } catch (Throwable th) {
            th.printStackTrace();
            fireOnFailed(-1, "失败");
        }
    }
}
