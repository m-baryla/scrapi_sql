USE [scrapi]
GO
/****** Object:  StoredProcedure [CORE].[GetUrlCollection]    Script Date: 11.07.2023 17:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:
-- Create date: 
-- Modify date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [CORE].[GetUrlCollection] 
AS
BEGIN
		
	select 
		c.Id,
		c.ScrapItem,
		c.Make,
		c.Model,
		c.UrlBase
	from CORE.UrlCollection c
	where c.Status = 1
	order by c.ScrapItem desc
	return 0
END

GO
