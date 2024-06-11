-- 쿼리문 최종본

drop database used_project;


create database used_project;

# 회원정보 테이블

use used_project;

CREATE TABLE customer(
		cu_seqno int unsigned auto_increment,
    cu_id varchar(255) NOT NULL unique,
    cu_pw varchar(255) NOT NULL,
    cu_name varchar(255) NOT NULL unique,
    cu_phone varchar(255) NOT NULL,
    cu_email varchar(255) NOT NULL,
    cu_birth varchar(255) NOT NULL,
    cu_gender VARCHAR(2) NOT NULL,
    reg_date datetime default CURRENT_TIMESTAMP null,
    
    primary key(cu_seqno)
);


# 상품 정보 테이블
create table product(
    pro_seqno int unsigned auto_increment,
    FK_cu_id varchar(255) NOT NULL,
    pro_consumer_id varchar(255) null,
    pro_title varchar(255) not null,
    pro_img varchar(255) not null,
    pro_price int,
    pro_area varchar(255),
    pro_sold_out int,
    pro_info text not null,
    pro_reg_date datetime default CURRENT_TIMESTAMP null,
    pro_sale_date datetime default CURRENT_TIMESTAMP null,
    pro_category varchar(255),
    primary key(pro_seqno)
);


ALTER DATABASE used_project CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

ALTER TABLE product CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


# 댓글 테이블
create table comment(
    co_seqno int auto_increment primary key,
    co_refer int default 0 not null,
    co_step int default 0 not null,
    co_depth int default 0 not null,
    co_commenter varchar(255) not null,
    co_comment varchar(4000) not null,
    co_reg_date datetime default CURRENT_TIMESTAMP,
    co_answer_num int default 0 not null,
    co_parent_num int default 0 not null,
    Fk_pro_seqno int default 0 not null
);