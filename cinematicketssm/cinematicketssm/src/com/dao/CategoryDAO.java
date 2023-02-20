package com.dao;
import java.util.*;




import com.bean.Category;
import com.bean.Movie;

import com.bean.User;
public interface CategoryDAO {
	Category findById(int id);
	void update(Category category);
	void add(Category category);
    List<Category> selectAll(HashMap map);
    void delete(int id);
}
