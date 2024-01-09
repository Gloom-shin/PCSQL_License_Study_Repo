-- 평균 대여기간이 7일 이상
-- 자동차 ID, 평균대여기간(소수점 두번째 자리 반올림) 리스트 출력
-- 1순위 평균대여기간 내림차순, 2순위 자동차 ID 내림차순
-- 반올림(평균())
SELECT CAR_ID, ROUND(AVG(DATEDIFF(END_DATE, START_DATE) + 1), 1) AS AVERAGE_DURATION
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
HAVING AVERAGE_DURATION >= 7
ORDER BY AVERAGE_DURATION DESC, CAR_ID DESC