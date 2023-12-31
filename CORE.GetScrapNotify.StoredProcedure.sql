USE [scrapi]
GO
/****** Object:  StoredProcedure [CORE].[GetScrapNotify]    Script Date: 11.07.2023 17:41:08 ******/
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
CREATE PROCEDURE [CORE].[GetScrapNotify]
AS
BEGIN
	
	declare @tmlTbl table
	(
		Body varchar(max)
	)

	
	declare
		@crs_ScrapItem varchar(max),
		@crs_OfferId varchar(max),
		@crs_Make varchar(max),
		@crs_Model varchar(max),
		@crs_OfferName varchar(max),
		@crs_PageBaseUrl varchar(max),
		@crs_SubPageBaseUrl varchar(max),
		@crs_ImageUrl1 varchar(max),
		@crs_ImageUrl2 varchar(max),
		@crs_Price varchar(max),
		@crs_Location varchar(max),
		@crs_Rev varchar(max)

	declare 
		@crs_OldPrice varchar(max),
		@Rev_num int = 0,
		@Rev_str nvarchar(150) = 'Rev',
		@Rev nvarchar(150)

	DECLARE db_cursor2 CURSOR FOR 
			select 
				c.ScrapItem
				,c.OfferId
				,c.Make
				,c.Model
				,c.OfferName
				,c.PageBaseUrl
				,c.SubPageBaseUrl
				,c.AdditionalInfo10
				,c.AdditionalInfo9
				,c.Price
				,c.Location
				,c.Rev
			from CORE.ScrapTemp c
	OPEN db_cursor2  
		FETCH NEXT FROM db_cursor2 INTO @crs_ScrapItem,@crs_OfferId,@crs_Make,@crs_Model,@crs_OfferName,@crs_PageBaseUrl,@crs_SubPageBaseUrl,@crs_ImageUrl1,@crs_ImageUrl2,@crs_Price,@crs_Location,@crs_Rev
		WHILE @@FETCH_STATUS = 0  
		BEGIN  
			--////////////
			if(@crs_Rev = 'Rev-1')
			begin
				insert into @tmlTbl (Body)
				select 
				(
					'<h1>NEW : ' + COALESCE(@crs_ScrapItem,'') + '</h1>' +
					'<br>' +
					'<a href="' + COALESCE(@crs_SubPageBaseUrl,'') + '">' + COALESCE(@crs_OfferName,'') + '</a>' +
					'<br>' +
					'<img src="' + COALESCE(@crs_ImageUrl1,'') + '">'+
					'<br>' +
					'<br>' +
					'<img src="' + COALESCE(@crs_ImageUrl2,'') + '">'+
					'<br>' +
					'<span>Price: </span><span> ' + COALESCE(@crs_Price,'') + '</span>' +
					'<br>' +
					'<span>Location: </span><span>'+ COALESCE(@crs_Location,'') + '</span>' +
					'<br>' +
					'<span>Revision: </span><span>' + COALESCE(@crs_Rev,'') + '</span>' +
					'<br>' +
					'<span>Id: </span><span>' + COALESCE(@crs_OfferId,'') + '</span>'
				)
			end
			else
			begin
				set @Rev_num = (select count(*) from CORE.Scrap c where c.OfferId = @crs_OfferId and c.ScrapItem = @crs_ScrapItem ) - 1
				set @Rev = concat(@Rev_str,'-',CAST(@Rev_num as varchar(999)))
				set @crs_OldPrice = (select top 1 c.Price from CORE.Scrap c where c.OfferId = @crs_OfferId and c.Rev = @Rev and c.ScrapItem = @crs_ScrapItem)
				
				insert into @tmlTbl (Body)
				select 
				(
					'<h1>UPDATE : ' + COALESCE(@crs_ScrapItem,'') + '</h1>' +
					'<br>' +
					'<a href="' + COALESCE(@crs_SubPageBaseUrl,'') + '">' + COALESCE(@crs_OfferName,'') + '</a>' +
					'<br>' +
					'<img src="' + COALESCE(@crs_ImageUrl1,'') + '">'+
					'<br>' +
					'<br>' +
					'<img src="' + COALESCE(@crs_ImageUrl2,'') + '">'+
					'<br>' +
					'<span>Old Price: </span><span> ' + COALESCE(@crs_OldPrice,'') + '</span>' +
					'<br>' +
					'<span>New Price: </span><span> ' + COALESCE(@crs_Price,'') + '</span>' +
					'<br>' +
					'<span>Location: </span><span>'+ COALESCE(@crs_Location,'') + '</span>' +
					'<br>' +
					'<span>Revision: </span><span>' + COALESCE(@crs_Rev,'') + '</span>' +
					'<br>' +
					'<span>Id: </span><span>' + COALESCE(@crs_OfferId,'') + '</span>'

				)
			end

			
			--////////////
		FETCH NEXT FROM db_cursor2 INTO @crs_ScrapItem,@crs_OfferId,@crs_Make,@crs_Model,@crs_OfferName,@crs_PageBaseUrl,@crs_SubPageBaseUrl,@crs_ImageUrl1,@crs_ImageUrl2,@crs_Price,@crs_Location,@crs_Rev
		END 
		CLOSE db_cursor2  
	DEALLOCATE db_cursor2 


	select * from @tmlTbl

	TRUNCATE TABLE CORE.ScrapTemp 

	return 0
END
GO
