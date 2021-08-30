package study.spring.zigme.service;

import study.spring.zigme.model.AdminStats;

public interface AdminStatsService {
	
	public AdminStats getstatsItem(AdminStats input) throws Exception;
	public int getstatsCount(AdminStats input) throws Exception;
	public int addstatsItem(AdminStats input) throws Exception;
	public int editstatsItem(AdminStats input) throws Exception;
}
