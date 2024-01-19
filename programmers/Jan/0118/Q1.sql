-- rest_review
-- 테이블에서 **리뷰를 가장 많이 작성한 회원**의 리뷰들을 조회하는 sql
-- 회원이름, 리뷰텍스트, 리뷰작성일
-- 1순위 리뷰작성일(asc),2순위 리뷰 텍스트(asc)
SELECT MEMBER_NAME,REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE FROM MEMBER_PROFILE m
                                                                                             JOIN REST_REVIEW r
                                                                                                  ON r.MEMBER_ID = m.MEMBER_ID
WHERE r.MEMBER_ID = (
    SELECT MEMBER_ID
    FROM REST_REVIEW
    GROUP BY MEMBER_ID
    ORDER BY COUNT(MEMBER_ID) DESC
    LIMIT 1

    )
ORDER BY REVIEW_DATE, REVIEW_TEXT