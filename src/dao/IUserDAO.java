package dao;


import java.util.List;

import domain.User;


public interface IUserDAO {
	
	//���һ���û������ݿ���
	public void addUser(User user);
	//�޸��û�
	public void alterUser(User user);
	
	//�����û���Ż�ȡ�û���Ϣ����User�������ʽ����
	public User getUserById(String id);
	
	//�����û�����ȡ�û���Ϣ����User���󷵻�
	public List<User> getUserByUserName(String userName);
	
}
