package com.tophey.model;

import com.tophey.common.DBColumnName;
import com.tophey.common.DBTableName;
import java.sql.Timestamp;


@DBTableName(value="server_info")
public class ServerInfo {

    @DBColumnName(value = "id")
    private int id;
    @DBColumnName(value = "name")
    private String name;
    @DBColumnName(value = "line")
    private String line;
    @DBColumnName(value = "description")
    private String description;
    @DBColumnName(value = "url")
    private String url;
    @DBColumnName(value = "title")
    private String title;
    @DBColumnName(value = "banner_url")
    private String bannerUrl;
    @DBColumnName(value = "category_id")
    private int categoryId;
    @DBColumnName(value = "create_date")
    private Timestamp createDate;
    @DBColumnName(value = "update_date")
    private Timestamp updateDate;
    @DBColumnName(value = "is_disabled")
    private int isDisabled;
    @DBColumnName(value = "disable_date")
    private Timestamp disableDate;
    @DBColumnName(value = "disable_reason")
    private String disableReason;

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

    public String getLine() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBannerUrl() {
        return bannerUrl;
    }

    public void setBannerUrl(String bannerUrl) {
        this.bannerUrl = bannerUrl;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    public int getIsDisable() {
        return isDisabled;
    }

    public void setIsDisable(int isDisable) {
        this.isDisabled = isDisable;
    }

    public Timestamp getDisableDate() {
        return disableDate;
    }

    public void setDisableDate(Timestamp disableDate) {
        this.disableDate = disableDate;
    }

    public String getDisableReason() {
        return disableReason;
    }

    public void setDisableReason(String disableReason) {
        this.disableReason = disableReason;
    }
}
