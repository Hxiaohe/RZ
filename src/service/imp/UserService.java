package service.imp;

import java.util.List;
import dao.IUserDAO;
import dao.imp.UserDAO;
import domain.User;
import service.IUserService;

/**
 * 用户服务类，用来处理业务逻辑
 */
public class UserService implements IUserService {
	/**
	 * 定义IUserDAO类型的属性，以实现UserService和IUserDAO实现类之间的协作
	 */
	private IUserDAO userDAO = new UserDAO();

	/**
	 * 默认构造函数
	 */
	public UserService() {
		
	}

	
	public void alterUser(User user) {
	
			userDAO.alterUser(user);
	}
	/**
	 * 往数据库中添加用户 如果用户名不存在，则添加，否则不添加
	 * 
	 * @param user
	 */
	public void addUser(User user) {
		// 如果用户为空，则返回，无需添加
		if (user.getUserName() == null)
			return;
	
		// 获得用户名
		String userName = user.getUserName();
		// 从数据库中查询用户名为userName的用户
		List<User> users = userDAO.getUserByUserName(userName);
		// 如果返回的用户记录数目小于等于0，说明该用户名不存在
		if (users.size() <= 0) {
			// 往数据库中添加用户
			userDAO.addUser(user);
		} else {
			// 抛出异常
			throw new RuntimeException("该用户名已存在，请更换用户名！");
		}
	}

	/**
	 * 根据参数id查询数据库中用户
	 * 
	 * @param id
	 * @return 返回查询所得用户
	 */
	public User getUserByID(String id) {
		// 如果id为空，则返回
		if (id == null)
			return null;
		return userDAO.getUserById(id);
	}

    /**
     * 验证用户的合法性
     * 
     * @param ，密码
     * @return 用户合法返回true，否则返回false
     */
	public User validateUser(String userName, String password) {

		//调用数据访问方法获取用户名对应的用户信息
		List<User> users = userDAO.getUserByUserName(userName);
		if (users != null && users.size() != 0) {
			if (users.get(0).getPassWord().equals(password)) {
				//如果用户名和密码合法，则返回用户的完整信息，否则返回null
				return users.get(0);
			}
			else
			{
				return null;
			}
		}
		else	
		{
			return null;
		}
	}
    
	/**
	 * 验证用户名是否已经存在
	 * 
	 * @param
	 * @return 存在则返回true，否则返回false
	 */
	public boolean isUserExist(String userName) {
		List<User> users = userDAO.getUserByUserName(userName);
		if(users.size()!=0)
			return true;
		else
			return false;
	}
}
