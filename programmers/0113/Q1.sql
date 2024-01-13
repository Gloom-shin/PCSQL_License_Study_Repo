-- 도서
-- 2022년 1월 저자 별, 카테고리 별 매출액을 구하여,  카테고리 별 매출액
-- 저자 ID , 저자명, 카테고리, 매출액 리스트 출력
-- 1순위 저자 ID(오름차순), 2순위 카테고리 내림차순

-- leftjoin으로 저자와 책 출판 정보를 합친다.
-- 책 판매 테이블에서 book_id  이때, 날짜는 2022년 1월만 (book_id 로 그룹화)
#
#
SELECT *
FROM BOOK # SELECT BOOK_ID, SUM(SALES)
FROM BOOK_SALES
    #
WHERE SALES_DATE >= '2022-01-01'
  AND '2022-01-31' >= SALES_DATE
    #
GROUP BY BOOK_ID

SELECT BOOK.AUTHOR_ID, AUTHOR_NAME, CATEGORY, sum((t * price)) as TOTAL_SALES
FROM BOOK
         JOIN (
               SELECT BOOK_ID, SUM(SALES) as t
               FROM BOOK_SALES
               WHERE SALES_DATE >= '2022-01-01' AND '2022-01-31' >= SALES_DATE
               GROUP BY BOOK_ID
               ) s
              ON BOOK.BOOK_ID = s.BOOK_ID
         JOIN AUTHOR
              ON BOOK.AUTHOR_ID = AUTHOR.AUTHOR_ID
GROUP BY AUTHOR_NAME, CATEGORY
ORDER BY BOOK.AUTHOR_ID ASC, CATEGORY DESC