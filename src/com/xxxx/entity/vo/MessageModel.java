package com.xxxx.entity.vo;

/**
 * 消息模型对象 （数据响应）
 *      状态码
 *          1=成功，0=失败
 *      提示信息
 *          字符串
 *      回显数据
 *          object对象
 */
public class MessageModel {

    private Integer code = 1; // 状态码 （1=成功，0=失败）
    private String msg = "成功！"; // 提示信息
    private Object object; // 回显对象 （基本数据类型、字符串类型、List、Map等）
    private Object file1;
    private Object file2;
    private Object file3;

    public Object getFile1() {
        return file1;
    }

    public void setFile1(Object file1) {
        this.file1 = file1;
    }

    public Object getFile2() {
        return file2;
    }

    public void setFile2(Object file2) {
        this.file2 = file2;
    }

    public Object getFile3() {
        return file3;
    }

    public void setFile3(Object file3) {
        this.file3 = file3;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }
}
