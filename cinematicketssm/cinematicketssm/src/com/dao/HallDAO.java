package com.dao;
import java.util.*;

import com.bean.Hall;
public interface HallDAO {
	Hall findById(int id);
	void update(Hall hall);
	void add(Hall hall);
	List<Hall> selectAll(HashMap map);
}
