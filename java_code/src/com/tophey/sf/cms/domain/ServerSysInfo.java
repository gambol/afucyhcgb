package com.tophey.sf.cms.domain;

import java.sql.Timestamp;

public class ServerSysInfo {

	private int id;
	private String name;
	private int categoryId;
	private Timestamp refreshDate;
	private double score;
	private int ping;
	private int serverNum;
	private Timestamp serverCreateTime;
	private Timestamp serverNewOpenTime;
	private int voteIn;
	private int voteOut;
	private int privilege;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public Timestamp getRefreshDate() {
		return refreshDate;
	}

	public void setRefreshDate(Timestamp refreshDate) {
		this.refreshDate = refreshDate;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getPing() {
		return ping;
	}

	public void setPing(int ping) {
		this.ping = ping;
	}

	public int getServerNum() {
		return serverNum;
	}

	public void setServerNum(int serverNum) {
		this.serverNum = serverNum;
	}

	public Timestamp getServerCreateTime() {
		return serverCreateTime;
	}

	public void setServerCreateTime(Timestamp serverCreateTime) {
		this.serverCreateTime = serverCreateTime;
	}

	public Timestamp getServerNewOpenTime() {
		return serverNewOpenTime;
	}

	public void setServerNewOpenTime(Timestamp serverNewOpenTime) {
		this.serverNewOpenTime = serverNewOpenTime;
	}

	public int getVoteIn() {
		return voteIn;
	}

	public void setVoteIn(int voteIn) {
		this.voteIn = voteIn;
	}

	public int getVoteOut() {
		return voteOut;
	}

	public void setVoteOut(int voteOut) {
		this.voteOut = voteOut;
	}

	public int getPrivilege() {
		return privilege;
	}

	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}

}
