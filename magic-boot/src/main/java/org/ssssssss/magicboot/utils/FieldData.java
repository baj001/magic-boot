package org.ssssssss.magicboot.utils;

/**
 * @author baj
 * @creat 2022-08-09 15:30
 */
public class FieldData {
    private String app_id;
    private String entity_id;
    private String table_name;
    private String table_comment;
    private String column_name;
    private String column_comment;
    private String column_type;
    private String is_key;
    private String is_null;
    private String auto_increment;

    public String getColumn_type() {
        return column_type;
    }

    public void setColumn_type(String column_type) {
        this.column_type = column_type;
    }

    public void setApp_id(String app_id) {
        this.app_id = app_id;
    }

    public void setEntity_id(String entity_id) {
        this.entity_id = entity_id;
    }

    public void setTable_name(String table_name) {
        this.table_name = table_name;
    }

    public void setTable_comment(String table_comment) {
        this.table_comment = table_comment;
    }

    public void setColumn_name(String column_name) {
        this.column_name = column_name;
    }

    public void setColumn_comment(String column_comment) {
        this.column_comment = column_comment;
    }

    public void setIs_key(String is_key) {
        this.is_key = is_key;
    }

    public void setIs_null(String is_null) {
        this.is_null = is_null;
    }

    public void setAuto_increment(String auto_increment) {
        this.auto_increment = auto_increment;
    }

    public String getApp_id() {
        return app_id;
    }

    public String getEntity_id() {
        return entity_id;
    }

    public String getTable_name() {
        return table_name;
    }

    public String getTable_comment() {
        return table_comment;
    }

    public String getColumn_name() {
        return column_name;
    }

    public String getColumn_comment() {
        return column_comment;
    }

    public String getIs_key() {
        return is_key;
    }

    public String getIs_null() {
        return is_null;
    }

    public String getAuto_increment() {
        return auto_increment;
    }
}
