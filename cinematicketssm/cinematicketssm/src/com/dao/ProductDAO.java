package com.dao;

import java.util.HashMap;
import java.util.List;

import com.bean.Product;

public interface ProductDAO {
	void add(Product product);
	List<Product> selectAll(HashMap map);
	Product findById(int id);
	void update(Product product);
	void delete(int id);
}