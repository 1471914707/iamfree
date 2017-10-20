package lin.jiayu.service.impl;

import java.util.List;

import lin.jiayu.dao.TabDao;
import lin.jiayu.dao.impl.TabDaoImpl;
import lin.jiayu.model.TTab;
import lin.jiayu.service.TabService;

public class TabServiceImpl implements TabService{
	TabDao tabDao;
	@Override
	public List<TTab> findAllTab() {
		// TODO Auto-generated method stub
		return tabDao.findByHQL("from TTab");
	}
	public TabDao getTabDao() {
		return tabDao;
	}
	public void setTabDao(TabDao tabDao) {
		this.tabDao = tabDao;
	}

}
