package com.dao;
import java.util.*;

import com.bean.Dingdan;
import com.bean.Hall;
public interface DingdanDAO {
	Dingdan findById(int id);
	void update(Dingdan dingdan);
	void add(Dingdan dingdan);
	List<Dingdan> selectAll(HashMap map);
	void delete(int id);
}
