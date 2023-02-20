package com.dao;
import java.util.*;





import com.bean.Movie;

import com.bean.Pinlun;
import com.bean.User;
public interface PinlunDAO {
	void add(Pinlun pinlun);
	List<Pinlun> selectAll(HashMap map);
	void delete(int id);
	Pinlun findById(int id);
}
