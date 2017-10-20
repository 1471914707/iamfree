package lin.jiayu.dao;

import lin.jiayu.model.TUser;

public interface UserDao extends BaseDao<TUser>{
	public TUser checkUser(String account,String password);
	public boolean checkUserPhone(String phone);
	public boolean checkUserEmail(String email);
}
