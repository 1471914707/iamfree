package lin.jiayu.dao.impl;

import java.util.List;

import lin.jiayu.dao.HelpDao;
import lin.jiayu.model.THelp;

public class HelpDaoImpl extends BaseDaoImpl<THelp> implements HelpDao{
	@Override
	public List<THelp> getRandThelp(int num) {
		// TODO Auto-generated method stub
		return super.queryPage("FROM THelp WHERE id >= ((SELECT MAX(id) FROM THelp)-(SELECT MIN(id) FROM THelp)) * RAND() + (SELECT MIN(id) FROM THelp) and state='T'", 0,num);
	}

}
