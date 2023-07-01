SELECT 
  T0.[CardCode], 
  T0.[CardName], 
  T0.[DocNum], 
  T0.[DocDate], 
  T0.[Project], 
  T1.[ItemCode], 
  T1.[Dscription], 
  T1.[DiscPrcnt], 
  T1.[Volume], 
  T1.[Weight1], 
  T1.[Quantity], 
  T1.[LineTotal], 
  T1.[VatSum], 
  T1.[Quantity] - T1.[OpenQty] as 'Apporved Quantity', 
  T1.[OpenQty], 
  T2.[OnHand], 
  T4.[SlpName], 
  T0.[Address2] 
FROM 
  [dbo].[ORDR] T0 
  INNER JOIN [dbo].[RDR1] T1 ON T0.[DocEntry] = T1.[DocEntry] 
  INNER JOIN OITM T2 ON T1.ItemCode = T2.ItemCode 
  INNER JOIN OCRD T3 ON T0.CardCode = T3.CardCode 
  INNER JOIN OSLP T4 ON T3.SlpCode = T4.SlpCode 
WHERE 
  T1.[OpenQty] > 0 
  and T0.[DocDate] >= '2022-01-01' 
ORDER BY 
  T0.[DocDate] desc
