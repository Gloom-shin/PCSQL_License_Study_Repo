-- 7월 아이스크림 총 주문량 +  상반기 아이스크림 총주문량
-- 큰 순서대로(내림차순) 상위 3개 맛 limit 3

-- flavor가 그룹
SELECT f.FLAVOR
FROM (
         (SELECT FLAVOR, sum(TOTAL_ORDER) as ft
          FROM FIRST_HALF
          GROUP BY FLAVOR) f
             JOIN
             (SELECT FLAVOR, sum(TOTAL_ORDER) as jt
              FROM JULY
              GROUP BY FLAVOR) j
         on f.FLAVOR = j.FLAVOR
         )
ORDER BY (ft + jt) DESC Limit 3