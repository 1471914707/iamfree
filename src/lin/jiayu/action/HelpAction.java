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
import lin.jiayu.model.TTab;
import lin.jiayu.model.TUser;
import lin.jiayu.service.CommentService;
import lin.jiayu.service.HelpService;
import lin.jiayu.service.TabService;
import lin.jiayu.service.UserService;
import lin.jiayu.service.impl.CommentServiceImpl;
import lin.jiayu.service.impl.HelpServiceImpl;
import lin.jiayu.service.impl.TabServiceImpl;
import lin.jiayu.service.impl.UserServiceImpl;
import lin.jiayu.tool.Pager;
import lin.jiayu.util.FileUtils;
import lin.jiayu.util.SystemContant;
import lin.jiayu.util.UploadUtils;

public class HelpAction extends ActionSupport implements ModelDriven<THelp>{
	HttpServletResponse response =ServletActionContext.getResponse();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	THelp help = new THelp();
	private String seo;
	private String type;
	private int pageNow;
	private String[] tabs;
	private String[] anonymous1;
	private Integer commentId;
	private List<File> upload;
	private List<String> uploadFileName;
	UserService userService;
	TabService tabService;
	HelpService helpService;
	CommentService commentService;

	@Override
	public THelp getModel() {
		// TODO Auto-generated method stub
		return help;
	}
	
	public String add(){
		List<TTab> ttab = tabService.findAllTab();
		request.setAttribute("ttab", ttab);
		return "add";
	}
	
	//删除问题
	public void delete() throws IOException{
		THelp help1 = helpService.get(help.getId());
		TUser user1 = (TUser) session.getAttribute("user");
		response.setContentType("text/html;charset=utf-8");  
	    //response.setCharacterEncoding("UTF-8");  
	    PrintWriter out = response.getWriter();  
	    //JSON在传递过程中是普通字符串形式传递的，这里简单拼接一个做测试  n
	    String jsonString;

		if (help1.getTUser().getId() != user1.getId())
			jsonString="{\"result\":\"false\",\"msg\":\""+"操作不允许"+"\"}"; 
		helpService.delete(help1);
		jsonString="{\"result\":\"true\",\"msg\":\""+"操作成功"+"\"}"; 
	    out.println(jsonString);
	    out.flush();  
	    out.close(); 
	}
	
	//查看自己的发布问题
	public String myhelps(){
		Pager pager = new Pager(getPageNow());
		TUser user = (TUser) session.getAttribute("user");
		List<THelp> helps = helpService.queryMyPage(user.getId(), getPageNow(), pager.getPageSize());
		request.setAttribute("myhelps", helps);
		request.setAttribute("page", pager);
		request.setAttribute("f", 0);//标记点击了哪个连接，0是提问，1是回答，2是评论
		return "myhelps";
	}
	
	public String agree(){
		//非自己操作
		THelp help1 = helpService.get(getModel().getId());
		TUser user1 = (TUser) session.getAttribute("user");
		if (help1.getTUser().getId() != user1.getId())
			return "success";
		//采纳成功
		help1.setBestpid(getCommentId());
		helpService.update(help1);
        request.setAttribute("help", help1);
        request.setAttribute("ImgPath", SystemContant.HELP_IMG_DIR);
        //采纳部分
        TComment besTComment = commentService.get(help1.getBestpid());
        request.setAttribute("bestComment", besTComment);
        //等你来答部分
        List<THelp> dnHelps = new ArrayList<THelp>();
        dnHelps = helpService.getRandThelp(6);
        request.setAttribute("dnHelps", dnHelps);
		return "detail";
	}
	
	public String detail(){
        THelp help1 = helpService.get(help.getId());
        help1.setLook(help1.getLook()+1);
        helpService.update(help1);
        request.setAttribute("help", help1);
        TUser user1 = userService.get(help1.getTUser().getId());
        request.setAttribute("user", user1);
        request.setAttribute("ImgPath", SystemContant.HELP_IMG_DIR);
        //采纳部分
        TComment besTComment = null;
        if (help1.getBestpid() != null)
        	besTComment = commentService.get(help1.getBestpid());
        request.setAttribute("bestComment", besTComment);
        //等你来答部分
        List<THelp> dnHelps = new ArrayList<THelp>();
        dnHelps = helpService.getRandThelp(6);
        request.setAttribute("dnHelps", dnHelps);
		return "detail";
	}
	
	@SuppressWarnings("null")
	public String commit() throws Exception{
		String tab = "";
		if (getTabs() == null){
	        help.setTab("");
		}else{
	        for(int i=0;i<this.getTabs().length;i++){  
	            tab +=this.getTabs()[i]+";";  
	         }
	        help.setTab(tab);
		}

        if (this.getAnonymous1() == null){
        	help.setAnonymous("F");
        }else{
        	help.setAnonymous("T");
        }
        TUser user = (TUser) session.getAttribute("user");
        user.setFcoin(user.getFcoin()-help.getFcoin());
        userService.update(user);
        help.setTUser(user);
        help.setState("T");
        help.setLook(0);
        //处理图片
        List<String> realPaths = new ArrayList<String>();
        String randonFileName;
        String paths = "";
        if (upload != null){
        	for (int i=0; i<uploadFileName.size(); i++){
        		randonFileName = UploadUtils.generateRandonFileName(getUploadFileName().get(i));
        		String p = request.getServletContext().getRealPath(SystemContant.HELP_IMG_DIR+"/"+randonFileName);
        		realPaths.add(p); 
        		paths += randonFileName+";";
        	}
        	FileUtils.copyMutilFile(upload, realPaths);
        }        
        help.setImgPath(paths);
        helpService.save(help);
        //THelp help1 = helpService.get(help.getId());
        request.setAttribute("helpId", help.getId());
		return "todetail";
	}
	/*搜索处理*/
	public String seo(){
		Pager pager = new Pager(getPageNow());
		List<THelp> helps = helpService.seo(getSeo(), getType(),getPageNow(),pager.getPageSize());		
		request.setAttribute("page", pager);
		request.setAttribute("helps", helps);
		return "seo_result";
	}

	public String[] getTabs() {
		return tabs;
	}

	public void setTabs(String[] tabs) {
		this.tabs = tabs;
	}

	public String[] getAnonymous1() {
		return anonymous1;
	}

	public void setAnonymous1(String[] anonymous1) {
		this.anonymous1 = anonymous1;
	}

	public List<File> getUpload() {
		return upload;
	}

	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public TabService getTabService() {
		return tabService;
	}

	public void setTabService(TabService tabService) {
		this.tabService = tabService;
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
}
