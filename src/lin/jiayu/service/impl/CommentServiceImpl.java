package lin.jiayu.service.impl;

import java.util.List;

import lin.jiayu.dao.CommentDao;
import lin.jiayu.model.TComment;
import lin.jiayu.service.CommentService;

public class CommentServiceImpl implements CommentService {
	CommentDao commentDao;
	
	@Override
	public void save(TComment comment) {
		// TODO Auto-generated method stub
		commentDao.save(comment);
	}
	@Override
	public int getCountByHelpComment(Integer id) {
		// TODO Auto-generated method stub
		return commentDao.getCountByHelpComment(id);
	}
	@Override
	public TComment get(Integer id) {
		// TODO Auto-generated method stub
		return commentDao.findById(id);
	}
	public CommentDao getCommentDao() {
		return commentDao;
	}
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	@Override
	public List<TComment> getCommentsByUserId(Integer id,int pageNow,int pageSize) {
		// TODO Auto-generated method stub
		//return commentDao.getCommentsByUserId(id,pageNow,pageSize);
		return commentDao.findByHQL2("from TComment where userid=?", pageNow, pageSize, id);
	}
	@Override
	public void delete(TComment comment) {
		// TODO Auto-generated method stub
		commentDao.delete(comment.getId());
	}

}
