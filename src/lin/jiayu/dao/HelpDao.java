package lin.jiayu.dao;

import java.util.List;

import lin.jiayu.model.THelp;

public interface HelpDao  extends BaseDao<THelp>{
	public List<THelp> getRandThelp(int num);
}
