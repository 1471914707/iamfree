package lin.jiayu.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import lin.jiayu.util.FileUtils;
import lin.jiayu.util.SnowflakeIdWorker;
import lin.jiayu.util.SystemContant;
import lin.jiayu.util.UploadUtils;
import lin.jiayu.util.VerCode;

public class UserAction  extends ActionSupport  implements ModelDriven<TUser>{
	HttpServletResponse response =ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	TUser user = new TUser();
	private int pageNow = 0;
	//上传,file的name跟页面表单一致
	private File upload;
	//文件的真实名字
	private String uploadFileName;
	private String account;
	private String password_repeat;
	private File photo;
	private String code;
	private String password_new;
	UserService userService;
	HelpService helpService;
	CommentService commentService;
	
	@Override
	public TUser getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	public String detail(){
		session.setAttribute("iconpath", SystemContant.ICON_DIR);
		Pager pager = new Pager(getPageNow());
		TUser user = (TUser) session.getAttribute("user");
		List<THelp> helps = helpService.queryMyPage(user.getId(), getPageNow(), pager.getPageSize());
		List<TComment> comments = commentService.getCommentsByUserId(user.getId(),pageNow,pager.getPageSize());
		request.setAttribute("myhelps", helps);
		request.setAttribute("page", pager);
		request.setAttribute("comments", comments);
		request.setAttribute("f", 0);//标记点击了哪个连接，0是提问，1是回答，2是评论
		return "detail";
	}
	//修改信息
	public void modify() throws IOException{
		String jsonString;
		TUser user1 = (TUser) session.getAttribute("user");
		if (user1==null || !user1.getPassword().equals(user.getPassword()))
			jsonString="{\"result\":\"false\",\"msg\":\""+"原密码不正确"+"\"}"; 
		else{
			user1.setPassword(getPassword_new());
			user1.setName(user.getName());
			user1.setIntro(user.getIntro());
			userService.update(user1);
			jsonString="{\"result\":\"true\",\"msg\":\""+"操作成功"+"\"}"; 
		}
		response.setContentType("text/html;charset=utf-8");  
	    //response.setCharacterEncoding("UTF-8");  
	    PrintWriter out = response.getWriter();  
	    out.println(jsonString);
	    out.flush();  
	    out.close(); 
	}
	//检查用户登录
	public String checkUser() throws Exception{
		TUser cuser = null;
		cuser = userService.checkUser(account, user.getPassword());
		if (cuser != null){
			//保存个人信息
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("user", cuser);	
			Pager pager = new Pager(getPageNow());
			request.setAttribute("page", pager);
			List<THelp>	helps = new ArrayList<THelp>();
			try {
				helps = helpService.queryPage(pageNow, pager.getPageSize());
			} catch (Exception e) {
				// TODO: handle exception
			}
			session.setAttribute("IconPath", SystemContant.ICON_DIR);
			request.setAttribute("helps", helps);
			return SUCCESS;
		}
		return "error";
	}
	
	public String register() throws Exception{
		//保存头像路径，确保唯一性
		Long imgpathNo = SnowflakeIdWorker.getSnowFlakeNumber();
		String verCode = (String) session.getAttribute("verCode");
		if (!this.code.equals(verCode)){
			this.addActionError("验证码错误");
		}
		String randonFileName = UploadUtils.generateRandonFileName(uploadFileName);
		String realPath = request.getServletContext().getRealPath(SystemContant.ICON_DIR+"/"+randonFileName);
		FileUtils.copyFile(getUpload(), realPath);
		user.setImgpath(randonFileName);
		user.setFcoin(100);
		userService.save(user);
		return "successregister";
	}
	
	//发送验证码
	public void postemail() throws IOException{
		String msg = "";
		if (userService.checkUserPhone(user.getTelephone()))
			//this.addActionError("手机号已经存在");
			msg = "手机号已经存在";
		if (userService.checkUserEmail(user.getEmail()))
			msg = "邮箱已经存在";
			//this.addActionError("邮箱已经存在");
		String code = VerCode.getVerCode(4);
        System.out.println("verCode="+code);
        session.setAttribute("verCode", code);
	    HttpServletResponse response=ServletActionContext.getResponse();  
	    /* 
	     * 在调用getWriter之前未设置编码(既调用setContentType或者setCharacterEncoding方法设置编码), 
	     * HttpServletResponse则会返回一个用默认的编码(既ISO-8859-1)编码的PrintWriter实例。这样就会 
	     * 造成中文乱码。而且设置编码时必须在调用getWriter之前设置,不然是无效的。 
	     * */  
	    response.setContentType("text/html;charset=utf-8");  
	    //response.setCharacterEncoding("UTF-8");  
	    PrintWriter out = response.getWriter();  
	    //JSON在传递过程中是普通字符串形式传递的，这里简单拼接一个做测试  n
	    String jsonString;
	    if ("".equals(msg))
	    	jsonString="{\"result\":\"true\",\"code\":\""+code+"\"}"; 
	    else {
	    	jsonString="{\"result\":\"false\",\"code\":\""+code+"\",\"msg\":\""+msg+"\"}"; 
		}
	    out.println(jsonString);
	    out.flush();  
	    out.close(); 
	}
	
	public String login(){
		return INPUT;
	}
	
	public TUser getUser() {
		return user;
	}
	public void setUser(TUser user) {
		this.user = user;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public File getPhoto() {
		return photo;
	}
	public void setPhoto(File photo) {
		this.photo = photo;
	}
	public String getPassword_repeat() {
		return password_repeat;
	}
	public void setPassword_repeat(String password_repeat) {
		this.password_repeat = password_repeat;
	}
	
	public String logout(){
		session.removeAttribute("user");
		return ERROR;
	}

	public String index() throws Exception {
		// TODO Auto-generated method stub
		session.setAttribute("IconPath", SystemContant.ICON_DIR);
		Pager pager = new Pager(getPageNow());
		request.setAttribute("page", pager);
		List<THelp>	helps = new ArrayList<THelp>();
		try {
			helps = helpService.queryPage(pageNow, pager.getPageSize());
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.setAttribute("helps", helps);
		return SUCCESS;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public HelpService getHelpService() {
		return helpService;
	}

	public void setHelpService(HelpService helpService) {
		this.helpService = helpService;
	}

	public CommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	public String getPassword_new() {
		return password_new;
	}

	public void setPassword_new(String password_new) {
		this.password_new = password_new;
	}
}
