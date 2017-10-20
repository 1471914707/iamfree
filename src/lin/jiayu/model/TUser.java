package lin.jiayu.model;

import java.util.HashSet;
import java.util.Set;

/**
 * TUser entity. @author MyEclipse Persistence Tools
 */

public class TUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String password;
	private String email;
	private String telephone;
	private Integer fcoin;
	private String intro;
	private String imgpath;
	private Set TCommentsForUserid = new HashSet(0);
	private Set TCommentsForReplyid = new HashSet(0);
	private Set THelps = new HashSet(0);

	// Constructors

	/** default constructor */
	public TUser() {
	}

	/** minimal constructor */
	public TUser(String name, String password) {
		this.name = name;
		this.password = password;
	}

	/** full constructor */
	public TUser(String name, String password, String email, String telephone, Integer fcoin, String intro,
			String imgpath, Set TCommentsForUserid, Set TCommentsForReplyid, Set THelps) {
		this.name = name;
		this.password = password;
		this.email = email;
		this.telephone = telephone;
		this.fcoin = fcoin;
		this.intro = intro;
		this.imgpath = imgpath;
		this.TCommentsForUserid = TCommentsForUserid;
		this.TCommentsForReplyid = TCommentsForReplyid;
		this.THelps = THelps;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Integer getFcoin() {
		return this.fcoin;
	}

	public void setFcoin(Integer fcoin) {
		this.fcoin = fcoin;
	}

	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getImgpath() {
		return this.imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public Set getTCommentsForUserid() {
		return this.TCommentsForUserid;
	}

	public void setTCommentsForUserid(Set TCommentsForUserid) {
		this.TCommentsForUserid = TCommentsForUserid;
	}

	public Set getTCommentsForReplyid() {
		return this.TCommentsForReplyid;
	}

	public void setTCommentsForReplyid(Set TCommentsForReplyid) {
		this.TCommentsForReplyid = TCommentsForReplyid;
	}

	public Set getTHelps() {
		return this.THelps;
	}

	public void setTHelps(Set THelps) {
		this.THelps = THelps;
	}

}