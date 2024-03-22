package com.gdu.prj08.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository

public class FileDaoImpl implements FileDao {

  private final SqlSessionTemplate sqlSessionTemplate ;
  
  public final static String NS = "com.gdu.prj08.mybatis.mapper.file_history.";
  
  
  @Override
  public int upload1(FileDao fileDao) {
    
    return 0;
  }

  @Override
  public Map<String, Object> upload2(FileDao fileDao) {
    
    return null;
  }

}
