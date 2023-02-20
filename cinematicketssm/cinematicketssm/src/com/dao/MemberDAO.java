package com.dao;
import java.util.*;

import com.bean.Member;
import com.bean.User;
public interface MemberDAO {
	List<Member> selectOne(String uname,String upass);
	void add(Member memmber);
	List<Member> selectOne(String uname);
	List<Member> checkUname(String uname);
	Member findById(int id);
	void delete(int id);
	List<Member> selectAll(HashMap map);
	void update(Member memmber);
	void updateYue(Member memmber);
}
