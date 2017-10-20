package lin.jiayu.service;

import java.util.List;

import lin.jiayu.model.THelp;

public interface HelpService {
	public void save(THelp help);
	public THelp get(Integer id);
	public void delete(THelp help);
	public void update(THelp help);
	public List<THelp> getRandThelp(int num);
	public List<THelp> queryPage(int pageNo, int pageSize);
	public List<THelp> queryMyPage(Integer id,int pageNo, int pageSize);
	public List<THelp> seo(String seo,String type,int pageNow,int pageSize);
}
