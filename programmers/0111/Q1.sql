-- 자동차 종류가 "세단"인 자동차 Car_type
-- 10월에 대여를 시작한 기록
-- 자동차 ID 리스트 출력(중복 x, 내림차순)
SELECT DISTINCT CAR_RENTAL_COMPANY_CAR.CAR_ID
FROM CAR_RENTAL_COMPANY_CAR
         JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY
              ON CAR_RENTAL_COMPANY_CAR.CAR_ID = CAR_RENTAL_COMPANY_RENTAL_HISTORY.CAR_ID
WHERE CAR_TYPE = "세단" AND MONTH (START_DATE) = 10
ORDER BY CAR_ID DESC