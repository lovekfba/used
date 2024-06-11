package com.bitstudy.app.service;

import com.bitstudy.app.domain.CommentDTO;
import com.bitstudy.app.domain.ProductDto;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CommentService {
    int parentInsert(CommentDTO DTO);

    @Transactional(rollbackFor = Exception.class)
    int childInsert(CommentDTO DTO);

    List<CommentDTO> selectAll();

    int delete(Integer co_seqno, String co_commenter);

    int update(CommentDTO DTO);

    List<ProductDto> selectProduct(Integer Fk_pro_seqno);

    int saleUpdate(ProductDto DTO);
}
