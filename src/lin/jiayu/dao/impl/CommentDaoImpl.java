package lin.jiayu.dao.impl;

import lin.jiayu.dao.CommentDao;
import lin.jiayu.model.TComment;

public class CommentDaoImpl extends BaseDaoImpl<TComment> implements CommentDao{

	@Override
	public int getCountByHelpComment(Integer id) {
		// TODO Auto-generated method stub
		return super.getCountByHQL("from TComment where TComment.THelp.id=?", id);
	}

}
