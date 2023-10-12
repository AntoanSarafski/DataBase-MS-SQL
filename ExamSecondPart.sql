SELECT 
	m.FirstName + ' ' + m.LastName AS Mechanic,
	j.Status,
	j.IssueDate
 FROM Mechanics AS m
 JOIN Jobs AS j ON j.MechanicId = m.MechanicId
 ORDER BY m.MechanicId, j.IssueDate, JobId


 SELECT 
	c.FirstName + ' ' + c.LastName AS Client,
	DATEDIFF(DAY, j.IssueDate, '2017-04-24') AS [Days going],
	j.Status
  FROM Clients AS c
  JOIN Jobs AS j ON j.ClientId = c.ClientId
  WHERE j.FinishDate IS NULL


  SELECT 
		m.FirstName + ' ' + m.LastName AS Mechanic,
		AVG(DATEDIFF(DAY, j.IssueDate, j.FinishDate)) AS [Average Days]
    FROM Mechanics AS m
	JOIN Jobs AS j ON j.MechanicId = m.MechanicId
	WHERE Status = 'Finished'
	GROUP BY m.FirstName, m.LastName, m.MechanicId, m.Address


	

	
	SELECT m.FirstName + ' ' + m.LastName AS Available
FROM Mechanics AS m
LEFT JOIN Jobs AS j ON m.MechanicId = j.MechanicId
WHERE Status = 'Finished' OR Status IS NULL
GROUP BY m.MechanicId, m.FirstName, m.LastName
ORDER BY m.MechanicId;



SELECT 
	p.PartId,
	p.Description,
	SUM(pn.Quantity) AS Required,
	p.StockQty AS [In Stock],
	ISNULL(SUM(op.quantity), 0) AS Ordered
FROM Parts AS P
LEFT JOIN PartsNeeded AS PN ON P.PartId = PN.PartId
LEFT JOIN Jobs AS J ON PN.JobId = J.JobId
LEFT JOIN OrderParts AS OP ON P.PartId = OP.PartId
LEFT JOIN Orders AS O ON OP.OrderID = O.OrderId
 WHERE (j.Status != 'Finished' OR j.Status IS NULL) AND 
       (j.FinishDate IS NULL OR j.FinishDate > GETDATE()) OR (o.Delivered = 0)
 GROUP BY p.PartId, p.Description, p.StockQty
 HAVING SUM(pn.Quantity) - p.StockQty - ISNULL(SUM(op.Quantity), 0) > 0
 ORDER BY p.PartId




