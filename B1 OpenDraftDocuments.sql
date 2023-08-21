SELECT 
  T0.[CardCode], 
  T0.[CardName], 
  T0.[DocNum], 
  T0.[DocDate], 
  T0.[Project], 
  T1.[ItemCode], 
  T1.[Dscription], 
  T1.[Quantity], 
  T2.[SlpName], 
  T0.[Address2] 
FROM 
  [dbo].[ODRF] T0 
  INNER JOIN [dbo].[DRF1] T1 ON T0.[DocEntry] = T1.[DocEntry] 
  INNER JOIN OSLP T2 ON T0.SlpCode = T2.SlpCode 
WHERE 
  T0.[Project] = [%0] 
  and T0.[DocDate] >= --'YYYY-MM-DD'
  and T0.[DocStatus] = 'O'
  
