-- 자동차의 종류가 트럭(트럭 종류가 2개)
-- 대여금액 (FEE), 대여기록ID, 대여 금액()리스트
-- 내림차순 1순위 대여금액, 2순위 대여기록 ID
-- 트럭 분류 필요!, 대여일 계산 필요

-- 대여일에 따른 할인율 가져오기
SELECT HISTORY_ID, ROUND(DAILY_FEE * rent * discount / 100, 0) AS FEE
FROM (SELECT HISTORY_ID,
             DAILY_FEE,
             DATEDIFF(DATE_ADD(END_DATE, INTERVAL 1 DAY), START_DATE) AS rent,
             CASE
                 WHEN DATEDIFF(DATE_ADD(END_DATE, INTERVAL 1 DAY), START_DATE) >= 90 THEN 100 -
                                                                                          CAST((SELECT DISCOUNT_RATE
                                                                                                FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                                                                                WHERE DURATION_TYPE = '90일 이상'
                                                                                                  AND CAR_TYPE = '트럭') AS UNSIGNED)
                 WHEN DATEDIFF(DATE_ADD(END_DATE, INTERVAL 1 DAY), START_DATE) >= 30 THEN 100 -
                                                                                          CAST((SELECT DISCOUNT_RATE
                                                                                                FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                                                                                WHERE DURATION_TYPE = '30일 이상'
                                                                                                  AND CAR_TYPE = '트럭') AS UNSIGNED)
                 WHEN DATEDIFF(DATE_ADD(END_DATE, INTERVAL 1 DAY), START_DATE) >= 7 THEN 100 -
                                                                                         CAST((SELECT DISCOUNT_RATE
                                                                                               FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
                                                                                               WHERE DURATION_TYPE = '7일 이상'
                                                                                                 AND CAR_TYPE = '트럭') AS UNSIGNED)
                 ELSE 100
                 END                                                  AS discount
      FROM CAR_RENTAL_COMPANY_CAR car
               JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY history
                    ON car.CAR_ID = history.CAR_ID
      where CAR_TYPE = '트럭') as t
ORDER BY FEE DESC, HISTORY_ID DESC;