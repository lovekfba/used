package com.bitstudy.app.dao;

import com.bitstudy.app.domain.CommentDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class PagenationDAO {
    @Autowired
    SqlSession session;

    String namespace = "com.bitstudy.app.dao.CommentMapper.";

    public int getCount(Integer Fk_pro_seqno) {
        return session.selectOne(namespace+"commentCount", Fk_pro_seqno);
    }

    public List<CommentDTO> selectPage(Map map) {
        return session.selectList(namespace+"selectPage", map);
    }


}
