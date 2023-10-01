SELECT TOP 1000 [Id],
	[Name], 
	[Instructions]
 FROM [MoiteRecepti].[dbo].[Recipes]
 ORDER BY LEN([Instructions]) DESC