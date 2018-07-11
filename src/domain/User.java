package domain;

import java.util.List;

public class User {
    private String  id;
    private String userName;
    private String passWord;
    private String gender;
    private String touxiang;
    private String qianming;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName){
        this.userName =userName;
    }
    public String getPassWord() {
        return passWord;
    }
    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getTouxiang() {
        return touxiang;
    }
    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang;
    }
    public String getQianming() {
        return qianming;
    }
    public void setQianming(String qianming) {
        this.qianming = qianming;
    }
}

