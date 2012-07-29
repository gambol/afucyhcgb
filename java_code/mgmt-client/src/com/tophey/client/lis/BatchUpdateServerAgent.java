/*
 * Copyright(c) 2007-2010 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2010-11-30 15:23:51
 */
package com.tophey.client.lis;

import com.tophey.client.dao.ServerPersister;
import com.tophey.common.ServerInfoDetail;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author fxcn
 */
public class BatchUpdateServerAgent {

    private Vector<BatchUpdateServerAgentListener> listeners = new Vector<BatchUpdateServerAgentListener>();

    protected String getThreadName() {
        return getClass().getName() + "-Thread";
    }

    public void addListener(BatchUpdateServerAgentListener lis) {
        listeners.add(lis);
    }

    public void removeListener(BatchUpdateServerAgentListener lis) {
        listeners.remove(lis);
    }

    public void removeAllListeners() {
        listeners.clear();
    }

    protected void fireOnStart() {
        for (BatchUpdateServerAgentListener lis : listeners) {
            lis.onStart();
        }
    }

    protected void fireOnSucceed(List<ServerInfoDetail> sids) {
        for (BatchUpdateServerAgentListener lis : listeners) {
            lis.onSuccess(sids);
        }
    }

    protected void fireOnFailed(int errCode, String errMsg) {
        for (BatchUpdateServerAgentListener lis : listeners) {
            lis.onFailed(errCode, errMsg);
        }
    }

    public void startUpdate(final List<ServerInfoDetail> sids) {
        new Thread(getClass().getName() + "-Thread") {

            @Override
            public void run() {
                fireOnStart();
                doUpdate(sids);
            }
        }.start();
    }

    private void doUpdate(List<ServerInfoDetail> sids) {
        try {

            new ServerPersister().updateServerInfoDetail(sids);
            fireOnSucceed(sids);
        } catch (Throwable th) {
            th.printStackTrace();
            fireOnFailed(-1, "失败");
        }
    }
}
