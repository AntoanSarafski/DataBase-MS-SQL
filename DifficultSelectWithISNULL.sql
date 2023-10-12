SELECT
    P.PartId AS [Part ID],
    P.[Description] AS Description,
    SUM(PN.Quantity) AS Required,
    P.StockQty AS [In Stock],
    ISNULL(SUM(OP.Quantity), 0) AS Ordered
FROM Parts AS P
LEFT JOIN PartsNeeded AS PN ON P.PartId = PN.PartId
LEFT JOIN Jobs AS J ON PN.JobId = J.JobId
LEFT JOIN OrderParts AS OP ON P.PartId = OP.PartId
LEFT JOIN Orders AS O ON OP.OrderID = O.OrderId
WHERE (
    (J.Status <> 'Finished' OR J.Status IS NULL)
    AND (J.FinishDate IS NULL OR J.FinishDate > GETDATE())
)
   OR (O.Delivered = 0)
GROUP BY P.PartId, P.[Description], P.StockQty
HAVING SUM(PN.Quantity) - P.StockQty - ISNULL(SUM(OP.Quantity), 0) > 0
ORDER BY P.PartId;
