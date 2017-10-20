package lin.jiayu.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * THelp entity. @author MyEclipse Persistence Tools
 */

public class THelp implements java.io.Serializable {

	// Fields

	private Integer id;
	private TUser TUser;
	private TComment TComment;
	private String title;
	private String content;
	private Timestamp begintime;
	private Timestamp endtime;
	private Integer fcoin;
	private String state;
	private String anonymous;
	private String tab;
	private String imgPath;
	private Integer look;
	private Integer bestpid;
	private Set TComments = new HashSet(0);

	// Constructors

	/** default constructor */
	public THelp() {
	}

	/** minimal constructor */
	public THelp(Timestamp begintime, String anonymous, Integer look) {
		this.begintime = begintime;
		this.anonymous = anonymous;
		this.look = look;
	}

	/** full constructor */
	public THelp(TUser TUser, TComment TComment, String title, String content, Timestamp begintime, Timestamp endtime,
			Integer fcoin, String state, String anonymous, String tab, String imgPath, Integer look, Integer bestpid,
			Set TComments) {
		this.TUser = TUser;
		this.TComment = TComment;
		this.title = title;
		this.content = content;
		this.begintime = begintime;
		this.endtime = endtime;
		this.fcoin = fcoin;
		this.state = state;
		this.anonymous = anonymous;
		this.tab = tab;
		this.imgPath = imgPath;
		this.look = look;
		this.bestpid = bestpid;
		this.TComments = TComments;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TUser getTUser() {
		return this.TUser;
	}

	public void setTUser(TUser TUser) {
		this.TUser = TUser;
	}

	public TComment getTComment() {
		return this.TComment;
	}

	public void setTComment(TComment TComment) {
		this.TComment = TComment;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getBegintime() {
		return this.begintime;
	}

	public void setBegintime(Timestamp begintime) {
		this.begintime = begintime;
	}

	public Timestamp getEndtime() {
		return this.endtime;
	}

	public void setEndtime(Timestamp endtime) {
		this.endtime = endtime;
	}

	public Integer getFcoin() {
		return this.fcoin;
	}

	public void setFcoin(Integer fcoin) {
		this.fcoin = fcoin;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getAnonymous() {
		return this.anonymous;
	}

	public void setAnonymous(String anonymous) {
		this.anonymous = anonymous;
	}

	public String getTab() {
		return this.tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

	public String getImgPath() {
		return this.imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public Integer getLook() {
		return this.look;
	}

	public void setLook(Integer look) {
		this.look = look;
	}

	public Integer getBestpid() {
		return this.bestpid;
	}

	public void setBestpid(Integer bestpid) {
		this.bestpid = bestpid;
	}

	public Set getTComments() {
		return this.TComments;
	}

	public void setTComments(Set TComments) {
		this.TComments = TComments;
	}

}