-- 22/08/01 ~ 22/10/31  총 대여 횟수가 5회이상 -> count
--  월별 자동차 ID, 총 대여횟수(RECORDS)
-- 1순위 월을 기준으로 오름차순, 2순위 자동차 ID  내림차순, 대여회수 0은 제거

-- 월별 횟수  대여횟수 계산 start_date만 계산
-- 총 대여회수가 5회 넘는 car_id 구함.
#
WITH MONTHLY_RENTAL AS (
    SELECT
        CAR_ID,
        MONTH(START_DATE) AS MONTH,
        COUNT(HISTORY_ID) AS MONTHLY_COUNT
    FROM
        CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE
        START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY
        CAR_ID, MONTH
),
TOTAL_RENTAL AS (
    SELECT
        CAR_ID,
        COUNT(HISTORY_ID) AS TOTAL_COUNT
    FROM
        CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE
        START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
    GROUP BY
        CAR_ID
    HAVING
        COUNT(HISTORY_ID) >= 5
)
SELECT
    M.MONTH,
    M.CAR_ID,
    M.MONTHLY_COUNT AS RECORDS
FROM
    MONTHLY_RENTAL M
        JOIN
    TOTAL_RENTAL T ON M.CAR_ID = T.CAR_ID
ORDER BY
    M.MONTH ASC, M.CAR_ID DESC;