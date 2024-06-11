package com.bitstudy.app.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.beans.ConstructorProperties;
import java.util.Date;

public class CommentDTO {

    private Integer co_seqno;
    private Integer co_refer;
    private Integer co_step;
    private Integer co_depth;
    private String co_commenter;
    private String co_comment;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date co_reg_date;
    private Integer co_answer_num;
    private Integer co_parent_num;
    private Integer Fk_pro_seqno;

    public CommentDTO() {}

    @ConstructorProperties({"co_seqno", "co_commenter", "co_comment", "Fk_pro_seqno"})
    public CommentDTO(Integer co_seqno, String co_commenter, String co_comment, Integer Fk_pro_seqno) {
        this.co_seqno = co_seqno;
        this.co_commenter = co_commenter;
        this.co_comment = co_comment;
        this.Fk_pro_seqno = Fk_pro_seqno;
    }

    public Integer getCo_seqno() {
        return co_seqno;
    }

    public void setCo_seqno(Integer co_seqno) {
        this.co_seqno = co_seqno;
    }

    public Integer getCo_refer() {
        return co_refer;
    }

    public void setCo_refer(Integer co_refer) {
        this.co_refer = co_refer;
    }

    public Integer getCo_step() {
        return co_step;
    }

    public void setCo_step(Integer co_step) {
        this.co_step = co_step;
    }

    public Integer getCo_depth() {
        return co_depth;
    }

    public void setCo_depth(Integer co_depth) {
        this.co_depth = co_depth;
    }

    public String getCo_commenter() {
        return co_commenter;
    }

    public void setCo_commenter(String co_commenter) {
        this.co_commenter = co_commenter;
    }

    public String getCo_comment() {
        return co_comment;
    }

    public void setCo_comment(String co_comment) {
        this.co_comment = co_comment;
    }

    public Date getCo_reg_date() {
        return co_reg_date;
    }

    public void setCo_reg_date(Date co_reg_date) {
        this.co_reg_date = co_reg_date;
    }

    public Integer getCo_answer_num() {
        return co_answer_num;
    }

    public void setCo_answer_num(Integer co_answer_num) {
        this.co_answer_num = co_answer_num;
    }

    public Integer getCo_parent_num() {
        return co_parent_num;
    }

    public void setCo_parent_num(Integer co_parent_num) {
        this.co_parent_num = co_parent_num;
    }

    public Integer getFk_pro_seqno() {
        return Fk_pro_seqno;
    }

    public void setFk_pro_seqno(Integer fk_pro_seqno) {
        Fk_pro_seqno = fk_pro_seqno;
    }

    @Override
    public String toString() {
        return "CommentDTO{" +
                "co_seqno=" + co_seqno +
                ", co_refer=" + co_refer +
                ", co_step=" + co_step +
                ", co_depth=" + co_depth +
                ", co_commenter='" + co_commenter + '\'' +
                ", co_comment='" + co_comment + '\'' +
                ", co_reg_date=" + co_reg_date +
                ", co_answer_num=" + co_answer_num +
                ", co_parent_num=" + co_parent_num +
                ", Fk_pro_seqno=" + Fk_pro_seqno +
                '}';
    }
}
