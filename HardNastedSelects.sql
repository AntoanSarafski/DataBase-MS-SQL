-- List all parts that are needed for active jobs (not Finished) without sufficient quantity in stock and in pending orders 
--(the sum of parts in stock and parts ordered is less than the required quantity). Order them by part ID (ascending).

--PartId	Description 	Required  In Stock  Ordered
-- 12	  Shock Dampener	    2	     1	      0



	SELECT
			pn.PartId AS [Part ID],
			p.[Description] AS [Description],
			pn.Quantity AS [Required],
			p.StockQty AS [In Stock],
			ISNULL(op.Ordered, 0) AS [Ordered]
	  FROM PartsNeeded AS pn
	  JOIN Parts AS p ON p.PartId = pn.PartId
 LEFT JOIN (
			SELECT op.PartId, COUNT(*) AS Ordered
			FROM OrderParts AS op
			JOIN Orders AS o ON o.OrderId = op.OrderId
			WHERE o.Delivered = 0
			GROUP BY op.PartId
		   ) op ON op.PartId = pn.PartId
      JOIN Jobs AS j ON j.JobId = pn.JobId
   WHERE (j.Status <> 'Finished') AND ((p.StockQty + ISNULL(op.Ordered, 0)) < pn.Quantity)
ORDER BY pn.PartId;

