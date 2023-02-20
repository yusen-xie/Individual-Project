package com.dao;
import java.util.*;



import com.bean.Movie;
import com.bean.User;
public interface MovieDAO {
	List<Movie> selectAll(HashMap map);
	void add(Movie movie);
	Movie findById(int id);
	void update(Movie movie);
}
