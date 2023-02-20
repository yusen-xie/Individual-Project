package com.dao;
import java.util.*;




import com.bean.Fav;
import com.bean.Movie;

import com.bean.User;
public interface FavDAO {
	void add(Fav fav);
	void delete(int id);
	List<Fav> selectAll(HashMap map);
}
