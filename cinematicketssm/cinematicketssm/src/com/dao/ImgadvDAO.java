package com.dao;
import java.util.*;




import com.bean.Imgadv;
import com.bean.Movie;

import com.bean.User;
public interface ImgadvDAO {
	List<Imgadv> selectAll();
	void add(Imgadv imgadv);
	void delete(int id);
}
