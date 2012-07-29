/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tophey.client.model;

import com.tophey.common.ServerInfoDetail;
import com.tophey.model.ServerInfo;
import com.tophey.model.ServerSysInfo;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author zhengli
 */
public class SSITableModel extends AbstractTableModel {

    public static final int NAME = 0;
    public static final int URL = 1;
    public static final int LINE = 2;
    public static final int SCORE = 3;
    public static final int SERVER_NUM = 4;
    public static final int DESC = 5;
    private List<ServerInfoDetail> serverInfoDetailList = new ArrayList<ServerInfoDetail>();
    private String[] columns = new String[]{"名称", "URL", "线路", "分数", "服务器数", "描述"};

    @Override
    public int getRowCount() {
        return serverInfoDetailList.size();
    }

    @Override
    public int getColumnCount() {
        return columns.length;
    }

    @Override
    public String getColumnName(int column) {
        return columns[column];
    }

    public Object getValueAt(int rowIndex, int columnIndex) {
        ServerInfoDetail sy = serverInfoDetailList.get(rowIndex);
        ServerSysInfo ssi = sy.getServerSysInfo();
        ServerInfo si = sy.getServerInfo();
        switch (columnIndex) {
            case NAME:
                return si.getName();
            case URL:
                return si.getUrl();
            case LINE:
                return si.getLine();
            case SERVER_NUM:
                return ssi.getServerNum();
            case SCORE:
                return ssi.getScore();
            case DESC:
                return si.getDescription();
            default:
                return null;
        }
    }

    public void add(int idx, ServerInfoDetail log) {
        serverInfoDetailList.add(idx, log);
        fireTableRowsDeleted(idx, idx);
    }

    public void update(ServerInfoDetail sid) {

        for (int i = 0; i < serverInfoDetailList.size(); i++) {
            ServerInfoDetail s = serverInfoDetailList.get(i);
            if (sid.getServerInfo().getId() == s.getServerInfo().getId()) {
                serverInfoDetailList.set(i, sid);
                fireTableRowsUpdated(i, i);
            }
        }
    }

    public void remove(ServerInfoDetail sid) {
        Iterator it = serverInfoDetailList.iterator();
        int idx = 0;
        while (it.hasNext()) {
            ServerInfoDetail sid1 = (ServerInfoDetail) it.next();
            if (sid.getServerInfo().getId() == sid1.getServerInfo().getId()) {
//                serverInfoDetailList.set(i, sid);
                it.remove();
                fireTableRowsDeleted(idx, idx);
                return;
            }
            idx++;
        }
    }

    public void removeList(List<ServerInfoDetail> sids) {
//        for(ServerInfoDetail sid:sids){
//            remove(sid);
//        }               

        Iterator it = serverInfoDetailList.iterator();
        int idx = 0;
        while (it.hasNext()) {
            ServerInfoDetail sid1 = (ServerInfoDetail) it.next();

            Iterator it1 = sids.iterator();
            while (it1.hasNext()) {
                ServerInfoDetail sid2 = (ServerInfoDetail) it1.next();
                if (sid1.getServerInfo().getId() == sid2.getServerInfo().getId()) {
//                serverInfoDetailList.set(i, sid);
                    it.remove();
                    fireTableRowsDeleted(idx, idx);
//                    return;
                }
            }
            idx++;
        }





    }

    public void removeAll() {
        serverInfoDetailList.clear();
        fireTableDataChanged();

    }

    public int indexOf(ServerInfoDetail log) {
        return serverInfoDetailList.indexOf(log);
    }

    public void setList(List<ServerInfoDetail> list) {
        serverInfoDetailList.clear();
        serverInfoDetailList.addAll(list);
        fireTableDataChanged();
    }

    public List<ServerInfoDetail> getList() {
        return serverInfoDetailList;
    }

    public ServerInfoDetail getServerInfoDetail(int idx) {
        return serverInfoDetailList.get(idx);
    }
}
