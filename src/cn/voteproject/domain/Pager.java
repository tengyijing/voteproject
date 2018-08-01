package cn.voteproject.domain;

import java.util.List;

/*
 * 用于分页实体类,使用泛型类实现代码重用的效果
 */
public class Pager<T> {
	private int pc;// 当前页码page code
	private Long tr;// 总记录数total record
	private int ps;// 每页记录数page size
	private int tp;// 总页数total page 可由总记录数和每页记录数计算得出
	private List<T> voteList;// 当前页的记录
								
	public int getPc() {
		return pc;
	}
	public void setPc(int pc) {
		this.pc = pc;
	}
	public int getPs() {
		return ps;
	}
	public void setPs(int ps) {
		this.ps = ps;
	}
	public Long getTr() {
		return tr;
	}
	public void setTr(Long tr) {
		this.tr = tr;
	}
	public List<T> getVoteList() {
		return voteList;
	}
	public void setVoteList(List<T> voteList) {
		this.voteList = voteList;
	}
	public int getTp() {
		return tp;
	}
	public void setTp(int tp) {
		this.tp = tp;
	}
}
