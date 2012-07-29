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
public class DeleteServerAgent {

    private Vector<DeleteServerAgentListener> listeners = new Vector<DeleteServerAgentListener>();

    protected String getThreadName() {
        return getClass().getName() + "-Thread";
    }

    public void addListener(DeleteServerAgentListener lis) {
        listeners.add(lis);
    }

    public void removeListener(DeleteServerAgentListener lis) {
        listeners.remove(lis);
    }

    public void removeAllListeners() {
        listeners.clear();
    }

    protected void fireOnStart() {
        for (DeleteServerAgentListener lis : listeners) {
            lis.onStart();
        }
    }

    protected void fireOnSucceed() {
        for (DeleteServerAgentListener lis : listeners) {
            lis.onSuccess();
        }
    }

    protected void fireOnFailed(int errCode, String errMsg) {
        for (DeleteServerAgentListener lis : listeners) {
            lis.onFailed(errCode, errMsg);
        }
    }

    public void startDelete(final List<ServerInfoDetail> sids) {
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

            new ServerPersister().deleteServerInfoDetails(sids);
            fireOnSucceed();
        } catch (Throwable th) {
            th.printStackTrace();
            fireOnFailed(-1, "失败");
        }
    }
}
