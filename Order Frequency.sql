SELECT 
  T0.[CardCode], 
  T0.[CardName], 
  Count(DISTINCT T0.[DocNum]) as 'Number of Orders', 
  Count(DISTINCT T0.[DocDate]) as 'Number of Days Ordered', 
  Count(T1.[ItemCode]) as 'Number of Row' 
FROM 
  ORDR T0 
  INNER JOIN RDR1 T1 ON T0.[DocEntry] = T1.[DocEntry] 
WHERE 
  T0.[DocDate] >= [ % 0] 
  and T0.[DocDate] <= [ % 1] 
GROUP BY 
  T0.[CardCode], 
  T0.[CardName]
