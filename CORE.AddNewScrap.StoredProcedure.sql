USE [scrapi]
GO
/****** Object:  StoredProcedure [CORE].[AddNewScrap]    Script Date: 11.07.2023 17:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













-- =============================================
 --Author:
 --Create date: 
 --Modify date: 
 --Description:	
-- =============================================
CREATE PROCEDURE [CORE].[AddNewScrap] 
(
	@ScrapItem nvarchar(max),
	@OfferId nvarchar(max),
	@Make nvarchar(max),
	@Model nvarchar(max),
	@OfferName nvarchar(max),
	@PageBaseUrl nvarchar(max),
	@SubPageBaseUrl nvarchar(max),
	@Price nvarchar(200),
	@Location nvarchar(200),
	@AddedDate nvarchar(200),
	@AdditionalInfo1 nvarchar(max),
	@AdditionalInfo2 nvarchar(max),
	@AdditionalInfo3 nvarchar(max),
	@AdditionalInfo4 nvarchar(max),
	@AdditionalInfo5 nvarchar(max),
	@AdditionalInfo6 nvarchar(max),
	@AdditionalInfo7 nvarchar(max),
	@AdditionalInfo8 nvarchar(max),
	@AdditionalInfo9 nvarchar(max),
	@AdditionalInfo10 nvarchar(max)
)
AS
BEGIN

	begin
		declare @Rev_num int 
		declare @Rev_str nvarchar(150) = 'Rev'
		declare @Rev nvarchar(200)
		declare @PriceLast nvarchar(200)
	end

	begin
		select top 1 
			@PriceLast = c.Price
		from CORE.Scrap c 
		where c.OfferId = @OfferId
		order by c.InsertDate desc
	end

	begin
		
		if (@Price != @PriceLast and @OfferId is not null)
		begin

			set @Rev_num = (select count(*) from CORE.Scrap c where c.OfferId = @OfferId) + 1
			set @Rev = concat(@Rev_str,'-',CAST(@Rev_num as varchar(999)))

				insert into CORE.Scrap
				(
					ScrapItem,
					OfferId,
					Make,
					Model,
					OfferName,
					PageBaseUrl,
					SubPageBaseUrl,
					Price,
					Location,
					AddedDate,
					InsertDate,
					Rev,
					AdditionalInfo1,
					AdditionalInfo2,
					AdditionalInfo3,
					AdditionalInfo4,
					AdditionalInfo5,
					AdditionalInfo6,
					AdditionalInfo7,
					AdditionalInfo8,
					AdditionalInfo9,
					AdditionalInfo10
				)
				values
				(
					trim(@ScrapItem),
					trim(@OfferId),
					trim(@Make),
					trim(@Model),
					trim(@OfferName),
					trim(@PageBaseUrl),
					trim(@SubPageBaseUrl),
					trim(@Price),
					trim(@Location),
					trim(@AddedDate),
					GETDATE(),
					trim(@Rev),
					trim(@AdditionalInfo1),
					trim(@AdditionalInfo2),
					trim(@AdditionalInfo3),
					trim(@AdditionalInfo4),
					trim(@AdditionalInfo5),
					trim(@AdditionalInfo6),
					trim(@AdditionalInfo7),
					trim(@AdditionalInfo8),
					trim(@AdditionalInfo9),
					trim(@AdditionalInfo10)
				)
				insert into CORE.ScrapTemp 
				(
					ScrapItem,
					OfferId,
					Make,
					Model,
					OfferName,
					PageBaseUrl,
					SubPageBaseUrl,
					Price,
					Location,
					AddedDate,
					InsertDate,
					Rev,
					AdditionalInfo1,
					AdditionalInfo2,
					AdditionalInfo3,
					AdditionalInfo4,
					AdditionalInfo5,
					AdditionalInfo6,
					AdditionalInfo7,
					AdditionalInfo8,
					AdditionalInfo9,
					AdditionalInfo10
				)
				values
				(
					trim(@ScrapItem),
					trim(@OfferId),
					trim(@Make),
					trim(@Model),
					trim(@OfferName),
					trim(@PageBaseUrl),
					trim(@SubPageBaseUrl),
					trim(@Price),
					trim(@Location),
					trim(@AddedDate),
					GETDATE(),
					trim(@Rev),
					trim(@AdditionalInfo1),
					trim(@AdditionalInfo2),
					trim(@AdditionalInfo3),
					trim(@AdditionalInfo4),
					trim(@AdditionalInfo5),
					trim(@AdditionalInfo6),
					trim(@AdditionalInfo7),
					trim(@AdditionalInfo8),
					trim(@AdditionalInfo9),
					trim(@AdditionalInfo10)
				)
			end
		else
		begin 
			
			if not exists (select c.OfferId from CORE.Scrap c where c.OfferId = @OfferId) and @OfferId is not null
			begin

				set @Rev_num = 1
				set @Rev = concat(@Rev_str,'-',CAST(@Rev_num as varchar(999)))

				insert into CORE.Scrap 
				(
					ScrapItem,
					OfferId,
					Make,
					Model,
					OfferName,
					PageBaseUrl,
					SubPageBaseUrl,
					Price,
					Location,
					AddedDate,
					InsertDate,
					Rev,
					AdditionalInfo1,
					AdditionalInfo2,
					AdditionalInfo3,
					AdditionalInfo4,
					AdditionalInfo5,
					AdditionalInfo6,
					AdditionalInfo7,
					AdditionalInfo8,
					AdditionalInfo9,
					AdditionalInfo10
				)
				values
				(
					trim(@ScrapItem),
					trim(@OfferId),
					trim(@Make),
					trim(@Model),
					trim(@OfferName),
					trim(@PageBaseUrl),
					trim(@SubPageBaseUrl),
					trim(@Price),
					trim(@Location),
					trim(@AddedDate),
					GETDATE(),
					trim(@Rev),
					trim(@AdditionalInfo1),
					trim(@AdditionalInfo2),
					trim(@AdditionalInfo3),
					trim(@AdditionalInfo4),
					trim(@AdditionalInfo5),
					trim(@AdditionalInfo6),
					trim(@AdditionalInfo7),
					trim(@AdditionalInfo8),
					trim(@AdditionalInfo9),
					trim(@AdditionalInfo10)
				)
				insert into CORE.ScrapTemp 
				(
					ScrapItem,
					OfferId,
					Make,
					Model,
					OfferName,
					PageBaseUrl,
					SubPageBaseUrl,
					Price,
					Location,
					AddedDate,
					InsertDate,
					Rev,
					AdditionalInfo1,
					AdditionalInfo2,
					AdditionalInfo3,
					AdditionalInfo4,
					AdditionalInfo5,
					AdditionalInfo6,
					AdditionalInfo7,
					AdditionalInfo8,
					AdditionalInfo9,
					AdditionalInfo10
				)
				values
				(
					trim(@ScrapItem),
					trim(@OfferId),
					trim(@Make),
					trim(@Model),
					trim(@OfferName),
					trim(@PageBaseUrl),
					trim(@SubPageBaseUrl),
					trim(@Price),
					trim(@Location),
					trim(@AddedDate),
					GETDATE(),
					trim(@Rev),
					trim(@AdditionalInfo1),
					trim(@AdditionalInfo2),
					trim(@AdditionalInfo3),
					trim(@AdditionalInfo4),
					trim(@AdditionalInfo5),
					trim(@AdditionalInfo6),
					trim(@AdditionalInfo7),
					trim(@AdditionalInfo8),
					trim(@AdditionalInfo9),
					trim(@AdditionalInfo10)
				)
			end
		end
	end

	return 0
	
END

GO
