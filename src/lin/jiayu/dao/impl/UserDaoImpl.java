package lin.jiayu.dao.impl;


import java.util.List;

import lin.jiayu.dao.UserDao;
import lin.jiayu.model.TUser;

public class UserDaoImpl extends BaseDaoImpl<TUser> implements UserDao {

	@Override
	public TUser checkUser(String account, String password) {
		// TODO Auto-generated method stub
		return (TUser) super.findByHQL("from TUser where email=? or telephone=? and password=?",account,account,password).get(0);
	}

	@Override
	public boolean checkUserPhone(String phone) {
		// TODO Auto-generated method stub
		List users = (List) super.findByHQL("from TUser where telephone=?",phone);
		return users.size()==0?false:true;
	}
	
	@Override
	public boolean checkUserEmail(String email) {
		// TODO Auto-generated method stub
		List users = (List) super.findByHQL("from TUser where email=?",email);
		return users.size()==0?false:true;
	}

}
