package com.dao;
import java.util.*;
import com.bean.Changci;
import com.bean.Seat;
public interface SeatDAO {
	void add(Seat seat);
	List<Seat> selectAll(HashMap map);
	Seat findById(int id);
	void update(Seat seat);
}
