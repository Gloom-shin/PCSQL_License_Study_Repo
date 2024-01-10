-- AVAILABILITY컬럼 22년 10월 16일에 대여중인 자동차인 경우 대여중, 아니면 대여가능
-- 자동차 ID (내림차순)
-- 먼저 해당 차가 대여중인지 체크 대여일이 10.16일 작거나 같고, 반납일이 10.16보다 크거나 같을 경우 carID의  AVAILABILITY컬럼은 대여중

-- GROUP BY 로 묶고 START_DATE	, END_DATE 는 2022-10-16을 빼서 0에 가까운수를 찾는다.
-- 이때 stat는 0보다 크고, end도 0보다 크면 대여중, 그외엔 대여가능이다.
SELECT CAR_ID,
       CASE
           WHEN CAR_ID IN
                (SELECT CAR_ID FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                 WHERE START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16')
               THEN '대여중'
           ELSE '대여가능'
           END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC;