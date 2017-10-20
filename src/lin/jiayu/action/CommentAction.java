package lin.jiayu.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import lin.jiayu.model.TComment;
import lin.jiayu.model.THelp;
import lin.jiayu.model.TUser;
import lin.jiayu.service.CommentService;
import lin.jiayu.service.HelpService;
import lin.jiayu.service.UserService;
import lin.jiayu.tool.Pager;
import lin.jiayu.util.SystemContant;

public class CommentAction extends ActionSupport implements ModelDriven<TComment>{
	CommentService commentService;
	HelpService helpService;
	UserService userService;
	private int pageNow;
	HttpServletResponse response =ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	private TComment comment = new TComment();
	private int userId;
	private int helpId;
	@Override
	public TComment getModel() {
		// TODO Auto-generated method stub
		return comment;
	}
	public String commit(){
		comment.setTUserByUserid(userService.get(getUserId()));
		comment.setTHelp(helpService.get(getHelpId()));;
		commentService.save(comment);
		THelp help = helpService.get(getHelpId());
		request.setAttribute("help", help);
		request.setAttribute("ImgPath", SystemContant.HELP_IMG_DIR);
		System.out.println("help.getTComments().size()="+help.getTComments().size());
		request.setAttribute("commentCount", help.getTComments().size());
		request.setAttribute("comments", help.getTComments());
		return "helpDetail";
	}
	//删除评论
	public void delete() throws IOException{
			TComment comment1 = commentService.get(comment.getId());
			TUser user1 = (TUser) session.getAttribute("user");
			response.setContentType("text/html;charset=utf-8");  
		    //response.setCharacterEncoding("UTF-8");  
		    PrintWriter out = response.getWriter();  
		    //JSON在传递过程中是普通字符串形式传递的，这里简单拼接一个做测试  n
		    String jsonString;

			if (comment.getTUserByUserid().getId() != user1.getId())
				jsonString="{\"result\":\"false\",\"msg\":\""+"操作不允许"+"\"}"; 
			commentService.delete(comment1);
			jsonString="{\"result\":\"true\",\"msg\":\""+"操作成功"+"\"}"; 
		    out.println(jsonString);
		    out.flush();  
		    out.close(); 
		}
	//查看自己发表的回答
	public String mycomments(){
		TUser user = (TUser) session.getAttribute("user");
		Pager pager = new Pager(getPageNow());
		List<TComment> comments = commentService.getCommentsByUserId(user.getId(),pageNow,pager.getPageSize());
		request.setAttribute("comments", comments);
		request.setAttribute("f", 1);
		return "mycomments";
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getHelpId() {
		return helpId;
	}
	public void setHelpId(int helpId) {
		this.helpId = helpId;
	}
	public CommentService getCommentService() {
		return commentService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	public HelpService getHelpService() {
		return helpService;
	}
	public void setHelpService(HelpService helpService) {
		this.helpService = helpService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
}
