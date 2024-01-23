-- 가격이 제일 비싼
-- 식품의 분류, 가격, 이름
-- 식품의 분류 = '과자', '국', '김치', '식용유' where in
-- 식품가격 내림차순

with m as (SELECT CATEGORY, MAX(PRICE) as MAX_PRICE
           FROM FOOD_PRODUCT
           WHERE CATEGORY IN ('과자', '국', '김치', '식용유')
           GROUP BY CATEGORY)
SELECT m.CATEGORY, MAX_PRICE, PRODUCT_NAME
FROM m
         JOIN FOOD_PRODUCT f
              ON f.CATEGORY = m.CATEGORY AND MAX_PRICE = PRICE
ORDER BY MAX_PRICE desc