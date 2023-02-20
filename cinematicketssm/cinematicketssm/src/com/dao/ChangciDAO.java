package com.dao;
import java.util.*;
import com.bean.Changci;
public interface ChangciDAO {
	void add(Changci changci);
	List<Changci> selectAll(HashMap map);
	Changci findById(int id);
	void delete(int id);
}
