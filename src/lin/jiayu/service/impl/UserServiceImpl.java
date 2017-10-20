package lin.jiayu.service.impl;

import lin.jiayu.dao.UserDao;
import lin.jiayu.model.TUser;
import lin.jiayu.service.UserService;

public class UserServiceImpl implements UserService{
	UserDao userDao;
	@Override
	public TUser checkUser(String account, String password) {
		// TODO Auto-generated method stub
		return userDao.checkUser(account,password);
	}
	@Override
	public void save(TUser user) {
		// TODO Auto-generated method stub
		userDao.save(user);
	}
	
	@Override
	public boolean checkUserPhone(String phone) {
		// TODO Auto-generated method stub
		return userDao.checkUserPhone(phone);
	}
	@Override
	public boolean checkUserEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.checkUserEmail(email);
	}
	@Override
	public TUser get(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findById(id);
	}
	@Override
	public void update(TUser user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
