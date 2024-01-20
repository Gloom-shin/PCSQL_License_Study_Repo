-- 서울에 위치한 식당들의 식당 ID
-- 식당 이름, 음식 종류, 즐겨찾기 수, 주소, **리뷰 평균 점수 **
SELECT i.REST_ID, REST_NAME, FOOD_TYPE, FAVORITES, ADDRESS, SCORE
FROM REST_INFO i
         JOIN (SELECT REST_ID, ROUND(AVG(REVIEW_SCORE), 2) AS SCORE
               FROM REST_REVIEW
               GROUP BY REST_ID) r
              ON i.REST_ID = r.REST_ID
WHERE subString(ADDRESS, 1, 2) = '서울'
ORDER BY SCORE desc, FAVORITES desc