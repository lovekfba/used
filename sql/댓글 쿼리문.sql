create database DB;

create schema USED_PROJECT;

use USED_PROJECT;

/***************** 댓글 *****************/

//------------- comment 테이블 생성

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


//------------- 부모 글 생성

        insert into comment values (null, (select ifnull(MAX(co_refer),0) + 1 from comment A), 0, 0, #{co_commenter}, #{co_comment}, now(), 0, 0, 0);

//------------- 답글 생성

        # 부모의 리퍼와 같고 부모의 스텝보다 큰 것들의 스텝을 1 증가
        UPDATE comment AS c1
        JOIN (SELECT co_refer, MAX(co_step) AS max_step FROM comment WHERE co_seqno = #{co_seqno}) AS c2
        ON c1.co_refer = c2.co_refer
        SET c1.co_step = c1.co_step + 1
        WHERE c1.co_step > c2.max_step


        insert  into comment values (null,
        (select co_refer from comment A where co_seqno = #{co_seqno}),
        (select co_step from comment A where co_seqno = #{co_seqno}) + 1,
        (select co_depth from comment A where co_seqno = #{co_seqno}) + 1, #{co_commenter}, #{co_comment}, now(), 0, 0, 0)

//------------- 글 전체 불러오기

        select * from comment order by co_refer, co_step;

//------------- 글 삭제하기

        delete from comment where co_seqno= #{co_seqno} and co_commenter = #{co_commenter}

//------------- 글 수정

        update comment set co_comment = #{co_comment}, co_reg_date = now() where co_seqno = #{co_seqno} and co_commenter = #{co_commenter}

