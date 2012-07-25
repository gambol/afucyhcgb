/*
 * Copyright(c) 2007-2010 by Yingzhi Tech
 * All Rights Reserved
 * 
 * Created at 2010-11-30 15:23:51
 */
package com.tophey.client.lis;

import com.tophey.client.dao.CategoryQuerier;
import com.tophey.client.dao.ServerPersister;
import com.tophey.common.ServerInfoDetail;
import com.tophey.model.Category;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author fxcn
 */
public class UpdateServerAgent {

    private Vector<UpdateServerAgentListener> listeners = new Vector<UpdateServerAgentListener>();

    protected String getThreadName() {
        return getClass().getName() + "-Thread";
    }

    public void addListener(UpdateServerAgentListener lis) {
        listeners.add(lis);
    }

    public void removeListener(UpdateServerAgentListener lis) {
        listeners.remove(lis);
    }

    public void removeAllListeners() {
        listeners.clear();
    }

    protected void fireOnStart() {
        for (UpdateServerAgentListener lis : listeners) {
            lis.onStart();
        }
    }

    protected void fireOnSucceed(ServerInfoDetail allCate) {
        for (UpdateServerAgentListener lis : listeners) {
            lis.onSuccess(allCate);
        }
    }

    protected void fireOnFailed(int errCode, String errMsg) {
        for (UpdateServerAgentListener lis : listeners) {
            lis.onFailed(errCode, errMsg);
        }
    }

    public void startUpdate(final ServerInfoDetail sid) {
        new Thread(getClass().getName() + "-Thread") {

            @Override
            public void run() {
                fireOnStart();
                doUpdate(sid);
            }
        }.start();
    }

    private void doUpdate(ServerInfoDetail sid) {
        try {

            new ServerPersister().updateServerInfoDetail(sid);
            fireOnSucceed(sid);
        } catch (Throwable th) {
            th.printStackTrace();
            fireOnFailed(-1, "失败");
        }
    }
}
