SELECT 
  T2.[ItemCode], 
  T2.[ItemName], 
  T1.[BinCode], 
  T1.[WhsCode], 
  T0.[OnHandQty], 
  T3.[OnOrder], 
  T3.[IsCommited] 
FROM 
  OIBQ T0 
  INNER JOIN OBIN T1 ON T0.BinAbs = T1.AbsEntry 
  INNER JOIN OITM T2 ON T0.ItemCode = T2.ItemCode 
  inner JOIN OITW T3 ON T2.[ItemCode] = T3.[ItemCode] 
  and T1.[WhsCode] = T3.[WhsCode] 
WHERE 
  T0.[OnHandQty] > '0' 
order by 
  T2.[ItemCode]
