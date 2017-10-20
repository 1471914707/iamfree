package lin.jiayu.model;

import java.sql.Timestamp;

/**
 * TComment entity. @author MyEclipse Persistence Tools
 */

public class TComment implements java.io.Serializable {

	// Fields

	private Integer id;
	private TUser TUserByReplyid;
	private TUser TUserByUserid;
	private THelp THelp;
	private String content;
	private Timestamp time;

	// Constructors

	/** default constructor */
	public TComment() {
	}

	/** full constructor */
	public TComment(TUser TUserByReplyid, TUser TUserByUserid, THelp THelp, String content, Timestamp time) {
		this.TUserByReplyid = TUserByReplyid;
		this.TUserByUserid = TUserByUserid;
		this.THelp = THelp;
		this.content = content;
		this.time = time;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public TUser getTUserByReplyid() {
		return this.TUserByReplyid;
	}

	public void setTUserByReplyid(TUser TUserByReplyid) {
		this.TUserByReplyid = TUserByReplyid;
	}

	public TUser getTUserByUserid() {
		return this.TUserByUserid;
	}

	public void setTUserByUserid(TUser TUserByUserid) {
		this.TUserByUserid = TUserByUserid;
	}

	public THelp getTHelp() {
		return this.THelp;
	}

	public void setTHelp(THelp THelp) {
		this.THelp = THelp;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

}