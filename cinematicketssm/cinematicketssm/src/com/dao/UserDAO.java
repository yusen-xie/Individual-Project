package com.dao;
import java.util.*;

import com.bean.User;
public interface UserDAO {
   User findById(int id);
   void update(User user);
   void updatepwd(int id,String userpassword);
   List<User> selectOne(User user);
   List<User> checkUsername(String username);
   void add(User user);
   List<User> selectAll(HashMap map);
   void delete(int id);
   List<User> usernamecheck(String username);
   
}
