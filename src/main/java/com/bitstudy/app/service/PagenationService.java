package com.bitstudy.app.service;

import com.bitstudy.app.dao.PagenationDAO;
import com.bitstudy.app.domain.CommentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PagenationService {
    @Autowired
    PagenationDAO pagenationDAO;

    public int getCount(Integer Fk_pro_seqno) {
        return pagenationDAO.getCount(Fk_pro_seqno);
    };

    public List<CommentDTO> selectPage (Map map) {
        return pagenationDAO.selectPage(map);
    }
}
