package lin.jiayu.service;

import java.util.List;

import lin.jiayu.model.TComment;

public interface CommentService {
	public void save(TComment comment);
	public void delete(TComment comment);
	public int getCountByHelpComment(Integer id);
	public TComment get(Integer id);
	public List<TComment> getCommentsByUserId(Integer id,int pageNow,int pageSize);
}
