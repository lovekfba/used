package com.bitstudy.app.dao;

import com.bitstudy.app.domain.CommentDTO;
import com.bitstudy.app.domain.ProductDto;

import java.util.List;

public interface CommentDAO {
    int parentInsert(CommentDTO DTO);

    int insertUpdate(CommentDTO DTO);

    int childInsert(CommentDTO DTO);

    List<CommentDTO> selectAll();

    int delete(Integer co_seqno, String co_commenter);

    int update(CommentDTO DTO);

    List<ProductDto> selectProduct(Integer Fk_pro_seqno);

    int saleUpdate(ProductDto DTO);
}
