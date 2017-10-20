package lin.jiayu.service;

import lin.jiayu.model.TUser;

public interface UserService {
	public TUser checkUser(String account,String password);
	public void save(TUser user);
	public boolean checkUserPhone(String phone);
	public boolean checkUserEmail(String email);
	public TUser get(Integer id);
	public void update(TUser user);
}
