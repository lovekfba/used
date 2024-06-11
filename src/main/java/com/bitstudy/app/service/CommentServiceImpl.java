package com.bitstudy.app.service;

import com.bitstudy.app.dao.CommentDAO;
import com.bitstudy.app.domain.CommentDTO;
import com.bitstudy.app.domain.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDAO commentDAO;

    @Override
    public int parentInsert(CommentDTO DTO) {
        return commentDAO.parentInsert(DTO);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int childInsert(CommentDTO DTO) {
        commentDAO.insertUpdate(DTO);
        return commentDAO.childInsert(DTO);
    }

    @Override
    public List<CommentDTO> selectAll() {
        return commentDAO.selectAll();
    }

    @Override
    public int delete(Integer co_seqno, String co_commenter) {
        return commentDAO.delete(co_seqno, co_commenter);
    }

    @Override
    public int update(CommentDTO DTO) {
        return commentDAO.update(DTO);
    }

    @Override
    public List<ProductDto> selectProduct(Integer Fk_pro_seqno) {
        return commentDAO.selectProduct(Fk_pro_seqno);
    }

    @Override
    public int saleUpdate(ProductDto DTO) {
        return commentDAO.saleUpdate(DTO);
    }
}
