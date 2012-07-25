/*
 * Copyright(c) 2007-2010 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2010-11-30 15:23:51
 */
package com.tophey.client.lis;

import com.tophey.client.dao.ServerPersister;
import com.tophey.common.ServerInfoDetail;
import java.util.Vector;

/**
 *
 * @author fxcn
 */
public class AddServerAgent {

    private Vector<AddServerAgentListener> listeners = new Vector<AddServerAgentListener>();

    protected String getThreadName() {
        return getClass().getName() + "-Thread";
    }

    public void addListener(AddServerAgentListener lis) {
        listeners.add(lis);
    }

    public void removeListener(AddServerAgentListener lis) {
        listeners.remove(lis);
    }

    public void removeAllListeners() {
        listeners.clear();
    }

    protected void fireOnStart() {
        for (AddServerAgentListener lis : listeners) {
            lis.onStart();
        }
    }

    protected void fireOnSucceed(ServerInfoDetail allCate) {
        for (AddServerAgentListener lis : listeners) {
            lis.onSuccess(allCate);
        }
    }

    protected void fireOnFailed(int errCode, String errMsg) {
        for (AddServerAgentListener lis : listeners) {
            lis.onFailed(errCode, errMsg);
        }
    }

    public void startAdd(final ServerInfoDetail sid) {
        new Thread(getClass().getName() + "-Thread") {

            @Override
            public void run() {
                fireOnStart();
                doAdd(sid);
            }
        }.start();
    }

    private void doAdd(ServerInfoDetail sid) {
        try {

            new ServerPersister().addServerInfoDetail(sid);
            fireOnSucceed(sid);
        } catch (Throwable th) {
            th.printStackTrace();
            fireOnFailed(-1, "失败");
        }
    }
}
