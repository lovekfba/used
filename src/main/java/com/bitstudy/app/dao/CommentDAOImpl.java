package com.bitstudy.app.dao;

import com.bitstudy.app.domain.CommentDTO;
import com.bitstudy.app.domain.ProductDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CommentDAOImpl implements CommentDAO {
    @Autowired
    SqlSession session;

    String namespace = "com.bitstudy.app.dao.CommentMapper.";

    @Override
    public int parentInsert(CommentDTO DTO) {
        return session.insert(namespace+"parentInsert", DTO);
    };

    @Override
    public int insertUpdate(CommentDTO DTO) {
        return session.insert(namespace+"insertUpdate", DTO);
    };

    @Override
    public int childInsert(CommentDTO DTO) {
        return session.insert(namespace+"childInsert", DTO);
    };

    @Override
    public List<CommentDTO> selectAll() {
        return session.selectList(namespace+"selectAll");
    };

    @Override
    public int delete(Integer co_seqno, String co_commenter) {

        Map map = new HashMap();
        map.put("co_seqno",co_seqno);
        map.put("co_commenter",co_commenter);

        return session.delete(namespace+"delete", map);

    };

    @Override
    public int update(CommentDTO DTO) {
        return session.update(namespace+"update", DTO);
    }

    @Override
    public List<ProductDto> selectProduct(Integer Fk_pro_seqno) {
        return session.selectList(namespace+"selectProduct", Fk_pro_seqno);
    }

    @Override
    public int saleUpdate(ProductDto DTO) {
        return session.update(namespace+"saleUpdate", DTO);
    }
}


