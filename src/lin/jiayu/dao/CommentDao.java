package lin.jiayu.dao;

import lin.jiayu.model.TComment;

public interface CommentDao  extends BaseDao<TComment>{
	public int getCountByHelpComment(Integer id);
}
