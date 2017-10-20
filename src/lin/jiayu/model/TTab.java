package lin.jiayu.model;

/**
 * TTab entity. @author MyEclipse Persistence Tools
 */

public class TTab implements java.io.Serializable {

	// Fields

	private Integer id;
	private String tab;

	// Constructors

	/** default constructor */
	public TTab() {
	}

	/** full constructor */
	public TTab(String tab) {
		this.tab = tab;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTab() {
		return this.tab;
	}

	public void setTab(String tab) {
		this.tab = tab;
	}

}