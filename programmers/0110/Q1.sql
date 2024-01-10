-- 자동차 종류가 "세단"인 자동차 Car_type
-- 10월에 대여를 시작한 기록
-- 자동차 ID 리스트 출력(중복 x, 내림차순)
SELECT CAR_ID FROM CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = "세단" AND CAR_ID in
                          (
                              SELECT CAR_ID FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                              WHERE START_DATE >='2022-10-01' AND START_DATE < '2022-11-01'
                          )
ORDER BY CAR_ID DESC