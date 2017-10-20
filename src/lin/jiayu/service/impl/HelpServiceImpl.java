package lin.jiayu.service.impl;

import java.util.List;

import lin.jiayu.dao.HelpDao;
import lin.jiayu.model.THelp;
import lin.jiayu.service.HelpService;

public class HelpServiceImpl implements HelpService {
	HelpDao helpDao;
	@Override
	public void save(THelp help) {
		// TODO Auto-generated method stub
		helpDao.save(help);
	}
	@Override
	public THelp get(Integer id) {
		// TODO Auto-generated method stub
		return helpDao.findById(id);
	}
	@Override
	public void update(THelp help) {
		// TODO Auto-generated method stub
		helpDao.update(help);
	}
	@Override
	public List<THelp> getRandThelp(int num) {
		// TODO Auto-generated method stub
		return helpDao.getRandThelp(num);
	}
	@Override
	public List<THelp> queryPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return helpDao.queryPage("from THelp order by begintime desc", pageNo, pageSize);
	}
	@Override
	public List<THelp> seo(String seo,String type,int pageNow,int pageSize) {
		// TODO Auto-generated method stub
		return helpDao.findByHQL2("from THelp where content like '%"+seo+"%'", pageNow,pageSize);
		/*if ("all".equals(type)){
			return helpDao.findByHQL2("from THelp where content like '%"+seo+"%'", pageNow,pageSize);
		}else if ("title".equals(type)){
			return helpDao.findByHQL2("from THelp where title like %?%", pageNow,pageSize,seo);
		}else if ("content".equals(type)){
			return helpDao.findByHQL2("from THelp where content like %?%",pageNow,pageSize, seo);
		}else {
			return helpDao.findByHQL2("from THelp where tab like %?% and (content like %?% or title like %?%)", pageNow,pageSize,type,seo);
		}*/
		
	}
	@Override
	public List<THelp> queryMyPage(Integer id,int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		System.out.println("my");
		return helpDao.findByHQL2("from THelp where TUser.id=? order by begintime desc", pageNo, pageSize,id);
	}
	@Override
	public void delete(THelp help) {
		// TODO Auto-generated method stub
		helpDao.delete(help.getId());
	}
	public HelpDao getHelpDao() {
		return helpDao;
	}
	public void setHelpDao(HelpDao helpDao) {
		this.helpDao = helpDao;
	}

}
