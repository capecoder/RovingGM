USE [master]
GO
/****** Object:  Database [rovingGM]    Script Date: 3/6/2018 9:09:07 AM ******/
CREATE DATABASE [rovingGM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'rovingGM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\rovingGM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'rovingGM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\rovingGM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [rovingGM] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [rovingGM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [rovingGM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [rovingGM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [rovingGM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [rovingGM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [rovingGM] SET ARITHABORT OFF 
GO
ALTER DATABASE [rovingGM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [rovingGM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [rovingGM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [rovingGM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [rovingGM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [rovingGM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [rovingGM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [rovingGM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [rovingGM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [rovingGM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [rovingGM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [rovingGM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [rovingGM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [rovingGM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [rovingGM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [rovingGM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [rovingGM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [rovingGM] SET RECOVERY FULL 
GO
ALTER DATABASE [rovingGM] SET  MULTI_USER 
GO
ALTER DATABASE [rovingGM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [rovingGM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [rovingGM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [rovingGM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [rovingGM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'rovingGM', N'ON'
GO
ALTER DATABASE [rovingGM] SET QUERY_STORE = OFF
GO
USE [rovingGM]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [rovingGM]
GO
/****** Object:  User [lightspeed]    Script Date: 3/6/2018 9:09:08 AM ******/
CREATE USER [lightspeed] FOR LOGIN [lightspeed] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [lightspeed]
GO
/****** Object:  UserDefinedTableType [dbo].[PrivateLessonSessionType]    Script Date: 3/6/2018 9:09:08 AM ******/
CREATE TYPE [dbo].[PrivateLessonSessionType] AS TABLE(
	[Id] [int] NULL,
	[SessionDate] [nvarchar](20) NULL,
	[DayOfWeek] [nvarchar](12) NULL,
	[StartTime] [nvarchar](10) NULL,
	[EndTime] [nvarchar](10) NULL,
	[RiderCoach] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[PrivateStudentId] [smallint] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[StudentType]    Script Date: 3/6/2018 9:09:08 AM ******/
CREATE TYPE [dbo].[StudentType] AS TABLE(
	[Student_ID] [int] NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[ClassCode] [nvarchar](50) NULL,
	[RangeCode] [nvarchar](50) NULL,
	[WrittenTestGrade] [smallint] NULL,
	[RideTestGrade] [smallint] NULL,
	[OverallGrade] [nvarchar](2) NULL,
	[CompletionCode] [nvarchar](3) NULL,
	[CompletionDate] [smalldatetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Operation] [smallint] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UpdateStudents]    Script Date: 3/6/2018 9:09:08 AM ******/
CREATE TYPE [dbo].[UpdateStudents] AS TABLE(
	[Student_ID] [int] NOT NULL,
	[WrittenTestGrade] [smallint] NULL,
	[RideTestGrade] [smallint] NULL,
	[OverallGrade] [nvarchar](2) NULL,
	[CompletionCode] [varchar](3) NULL,
	[CompletionDate] [smalldatetime] NULL,
	PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedFunction [dbo].[parseJSON]    Script Date: 3/6/2018 9:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[parseJSON]( @JSON NVARCHAR(MAX))

RETURNS @hierarchy TABLE

  (

   element_id INT IDENTITY(1, 1) NOT NULL, /* internal surrogate primary key gives the order of parsing and the list order */

   sequenceNo [int] NULL, /* the place in the sequence for the element */

   parent_ID INT,/* if the element has a parent then it is in this column. The document is the ultimate parent, so you can get the structure from recursing from the document */

   Object_ID INT,/* each list or object has an object id. This ties all elements to a parent. Lists are treated as objects here */

   NAME NVARCHAR(2000),/* the name of the object */

   StringValue NVARCHAR(MAX) NOT NULL,/*the string representation of the value of the element. */

   ValueType VARCHAR(10) NOT null /* the declared type of the value represented as a string in StringValue*/

  )

AS

BEGIN

  DECLARE

    @FirstObject INT, --the index of the first open bracket found in the JSON string

    @OpenDelimiter INT,--the index of the next open bracket found in the JSON string

    @NextOpenDelimiter INT,--the index of subsequent open bracket found in the JSON string

    @NextCloseDelimiter INT,--the index of subsequent close bracket found in the JSON string

    @Type NVARCHAR(10),--whether it denotes an object or an array

    @NextCloseDelimiterChar CHAR(1),--either a '}' or a ']'

    @Contents NVARCHAR(MAX), --the unparsed contents of the bracketed expression

    @Start INT, --index of the start of the token that you are parsing

    @end INT,--index of the end of the token that you are parsing

    @param INT,--the parameter at the end of the next Object/Array token

    @EndOfName INT,--the index of the start of the parameter at end of Object/Array token

    @token NVARCHAR(200),--either a string or object

    @value NVARCHAR(MAX), -- the value as a string

    @SequenceNo int, -- the sequence number within a list

    @name NVARCHAR(200), --the name as a string

    @parent_ID INT,--the next parent ID to allocate

    @lenJSON INT,--the current length of the JSON String

    @characters NCHAR(36),--used to convert hex to decimal

    @result BIGINT,--the value of the hex symbol being parsed

    @index SMALLINT,--used for parsing the hex value

    @Escape INT --the index of the next escape character

   

 

  DECLARE @Strings TABLE /* in this temporary table we keep all strings, even the names of the elements, since they are 'escaped' in a different way, and may contain, unescaped, brackets denoting objects or lists. These are replaced in the JSON string by tokens representing the string */

    (

     String_ID INT IDENTITY(1, 1),

     StringValue NVARCHAR(MAX)

    )

  SELECT--initialise the characters to convert hex to ascii

    @characters='0123456789abcdefghijklmnopqrstuvwxyz',

    @SequenceNo=0, --set the sequence no. to something sensible.

  /* firstly we process all strings. This is done because [{} and ] aren't escaped in strings, which complicates an iterative parse. */

    @parent_ID=0;

  WHILE 1=1 --forever until there is nothing more to do

    BEGIN

      SELECT

        @start=PATINDEX('%[^a-zA-Z]["]%', @json collate SQL_Latin1_General_CP850_Bin);--next delimited string

      IF @start=0 BREAK --no more so drop through the WHILE loop

      IF SUBSTRING(@json, @start+1, 1)='"'

        BEGIN --Delimited Name

          SET @start=@Start+1;

          SET @end=PATINDEX('%[^\]["]%', RIGHT(@json, LEN(@json+'|')-@start) collate SQL_Latin1_General_CP850_Bin);

        END

      IF @end=0 --no end delimiter to last string

        BREAK --no more

      SELECT @token=SUBSTRING(@json, @start+1, @end-1)

      --now put in the escaped control characters

      SELECT @token=REPLACE(@token, FROMString, TOString)

      FROM

        (SELECT

          '\"' AS FromString, '"' AS ToString

         UNION ALL SELECT '\\', '\'

         UNION ALL SELECT '\/', '/'

         UNION ALL SELECT '\b', CHAR(08)

         UNION ALL SELECT '\f', CHAR(12)

         UNION ALL SELECT '\n', CHAR(10)

         UNION ALL SELECT '\r', CHAR(13)

         UNION ALL SELECT '\t', CHAR(09)

        ) substitutions

      SELECT @result=0, @escape=1

  --Begin to take out any hex escape codes

      WHILE @escape>0

        BEGIN

          SELECT @index=0,

          --find the next hex escape sequence

          @escape=PATINDEX('%\x[0-9a-f][0-9a-f][0-9a-f][0-9a-f]%', @token collate SQL_Latin1_General_CP850_Bin)

          IF @escape>0 --if there is one

            BEGIN

              WHILE @index<4 --there are always four digits to a \x sequence  

                BEGIN

                  SELECT --determine its value

                    @result=@result+POWER(16, @index)

                    *(CHARINDEX(SUBSTRING(@token, @escape+2+3-@index, 1),

                                @characters)-1), @index=@index+1 ;

        

                END

                -- and replace the hex sequence by its unicode value

              SELECT @token=STUFF(@token, @escape, 6, NCHAR(@result))

            END

        END

      --now store the string away

      INSERT INTO @Strings (StringValue) SELECT @token

      -- and replace the string with a token

      SELECT @JSON=STUFF(@json, @start, @end+1,

                    '@string'+CONVERT(NVARCHAR(5), @@identity))

    END

  -- all strings are now removed. Now we find the first leaf. 

  WHILE 1=1  --forever until there is nothing more to do

  BEGIN

 

  SELECT @parent_ID=@parent_ID+1

  --find the first object or list by looking for the open bracket

  SELECT @FirstObject=PATINDEX('%[{[[]%', @json collate SQL_Latin1_General_CP850_Bin)--object or array

  IF @FirstObject = 0 BREAK

  IF (SUBSTRING(@json, @FirstObject, 1)='{')

    SELECT @NextCloseDelimiterChar='}', @type='object'

  ELSE

    SELECT @NextCloseDelimiterChar=']', @type='array'

  SELECT @OpenDelimiter=@firstObject

 

  WHILE 1=1 --find the innermost object or list...

    BEGIN

      SELECT

        @lenJSON=LEN(@JSON+'|')-1

  --find the matching close-delimiter proceeding after the open-delimiter

      SELECT

        @NextCloseDelimiter=CHARINDEX(@NextCloseDelimiterChar, @json,

                                      @OpenDelimiter+1)

  --is there an intervening open-delimiter of either type

      SELECT @NextOpenDelimiter=PATINDEX('%[{[[]%',

             RIGHT(@json, @lenJSON-@OpenDelimiter)collate SQL_Latin1_General_CP850_Bin)--object

      IF @NextOpenDelimiter=0

        BREAK

      SELECT @NextOpenDelimiter=@NextOpenDelimiter+@OpenDelimiter

      IF @NextCloseDelimiter<@NextOpenDelimiter

        BREAK

      IF SUBSTRING(@json, @NextOpenDelimiter, 1)='{'

        SELECT @NextCloseDelimiterChar='}', @type='object'

      ELSE

        SELECT @NextCloseDelimiterChar=']', @type='array'

      SELECT @OpenDelimiter=@NextOpenDelimiter

    END

  ---and parse out the list or name/value pairs

  SELECT

    @contents=SUBSTRING(@json, @OpenDelimiter+1,

                        @NextCloseDelimiter-@OpenDelimiter-1)

  SELECT

    @JSON=STUFF(@json, @OpenDelimiter,

                @NextCloseDelimiter-@OpenDelimiter+1,

                '@'+@type+CONVERT(NVARCHAR(5), @parent_ID))

  WHILE (PATINDEX('%[A-Za-z0-9@+.e]%', @contents collate SQL_Latin1_General_CP850_Bin))<>0

    BEGIN

      IF @Type='Object' --it will be a 0-n list containing a string followed by a string, number,boolean, or null

        BEGIN

          SELECT

            @SequenceNo=0,@end=CHARINDEX(':', ' '+@contents)--if there is anything, it will be a string-based name.

          SELECT  @start=PATINDEX('%[^A-Za-z@][@]%', ' '+@contents collate SQL_Latin1_General_CP850_Bin)--AAAAAAAA

          SELECT @token=SUBSTRING(' '+@contents, @start+1, @End-@Start-1),

            @endofname=PATINDEX('%[0-9]%', @token collate SQL_Latin1_General_CP850_Bin),

            @param=RIGHT(@token, LEN(@token)-@endofname+1)

          SELECT

            @token=LEFT(@token, @endofname-1),

            @Contents=RIGHT(' '+@contents, LEN(' '+@contents+'|')-@end-1)

          SELECT  @name=stringvalue FROM @strings

            WHERE string_id=@param --fetch the name

        END

      ELSE

        SELECT @Name=null,@SequenceNo=@SequenceNo+1

      SELECT

        @end=CHARINDEX(',', @contents)-- a string-token, object-token, list-token, number,boolean, or null

      IF @end=0

        SELECT  @end=PATINDEX('%[A-Za-z0-9@+.e][^A-Za-z0-9@+.e]%', @Contents+' ' collate SQL_Latin1_General_CP850_Bin)

          +1

       SELECT

        @start=PATINDEX('%[^A-Za-z0-9@+.e][A-Za-z0-9@+.e]%', ' '+@contents collate SQL_Latin1_General_CP850_Bin)

      --select @start,@end, LEN(@contents+'|'), @contents 

      SELECT

        @Value=RTRIM(SUBSTRING(@contents, @start, @End-@Start)),

        @Contents=RIGHT(@contents+' ', LEN(@contents+'|')-@end)

      IF SUBSTRING(@value, 1, 7)='@object'

        INSERT INTO @hierarchy

          (NAME, SequenceNo, parent_ID, StringValue, Object_ID, ValueType)

          SELECT @name, @SequenceNo, @parent_ID, SUBSTRING(@value, 8, 5),

            SUBSTRING(@value, 8, 5), 'object'

      ELSE

        IF SUBSTRING(@value, 1, 6)='@array'

          INSERT INTO @hierarchy

            (NAME, SequenceNo, parent_ID, StringValue, Object_ID, ValueType)

            SELECT @name, @SequenceNo, @parent_ID, SUBSTRING(@value, 7, 5),

              SUBSTRING(@value, 7, 5), 'array'

        ELSE

          IF SUBSTRING(@value, 1, 7)='@string'

            INSERT INTO @hierarchy

              (NAME, SequenceNo, parent_ID, StringValue, ValueType)

              SELECT @name, @SequenceNo, @parent_ID, stringvalue, 'string'

              FROM @strings

              WHERE string_id=SUBSTRING(@value, 8, 5)

          ELSE

            IF @value IN ('true', 'false')

              INSERT INTO @hierarchy

                (NAME, SequenceNo, parent_ID, StringValue, ValueType)

                SELECT @name, @SequenceNo, @parent_ID, @value, 'boolean'

            ELSE

              IF @value='null'

                INSERT INTO @hierarchy

                  (NAME, SequenceNo, parent_ID, StringValue, ValueType)

                  SELECT @name, @SequenceNo, @parent_ID, @value, 'null'

              ELSE

                IF PATINDEX('%[^0-9]%', @value collate SQL_Latin1_General_CP850_Bin)>0

                  INSERT INTO @hierarchy

                    (NAME, SequenceNo, parent_ID, StringValue, ValueType)

                    SELECT @name, @SequenceNo, @parent_ID, @value, 'real'

                ELSE

                  INSERT INTO @hierarchy

                    (NAME, SequenceNo, parent_ID, StringValue, ValueType)

                    SELECT @name, @SequenceNo, @parent_ID, @value, 'int'

      if @Contents=' ' Select @SequenceNo=0

    END

  END

INSERT INTO @hierarchy (NAME, SequenceNo, parent_ID, StringValue, Object_ID, ValueType)

  SELECT '-',1, NULL, '', @parent_id-1, @type

--

   RETURN

END
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 3/6/2018 9:09:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ManagerFirstName] [nvarchar](50) NULL,
	[ManagerLastName] [nvarchar](50) NULL,
	[ManagerEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 3/6/2018 9:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](50) NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visits]    Script Date: 3/6/2018 9:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visits](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UnitsSold_Today] [int] NULL,
	[UnitsSoldGP_Today] [money] NULL,
	[UnitsDelivered_MTD] [int] NULL,
	[UnitsSoldTotalGP_MTD] [money] NULL,
	[ReadyForSaleStatus] [varchar](max) NULL,
	[ModelMix] [varchar](max) NULL,
	[PricingVsAge] [varchar](max) NULL,
	[boCloses_Today] [int] NULL,
	[boGrossProfit_Today] [money] NULL,
	[boCloses_MTD] [int] NULL,
	[boGrossProfit_MTD] [money] NULL,
	[boGoal] [money] NULL,
	[partsSales_MTD] [money] NULL,
	[partsGoal_MTD] [money] NULL,
	[ServiceSales_MTD] [money] NULL,
	[serviceGoal_MTD] [money] NULL,
	[VisitDate] [datetime] NULL,
	[ArrivalTime] [varchar](50) NULL,
	[DepartureTime] [varchar](50) NULL,
	[Displays] [varchar](max) NULL,
	[Cleanliness_Organization] [varchar](max) NULL,
	[StaffingReview] [varchar](max) NULL,
	[Store] [int] NULL,
	[Manager] [int] NULL,
 CONSTRAINT [PK_Visits] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 3/6/2018 9:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Managers.ManagerFirstName + '  ' + dbo.Managers.ManagerLastName AS ManagerName, dbo.Visits.UnitsSold_Today, dbo.Visits.UnitsSoldGP_Today, dbo.Visits.UnitsDelivered_MTD, dbo.Visits.UnitsSoldTotalGP_MTD, 
                         dbo.Visits.ReadyForSaleStatus, dbo.Visits.ModelMix, dbo.Visits.PricingVsAge, dbo.Visits.boCloses_Today, dbo.Visits.boGrossProfit_Today, dbo.Visits.boGrossProfit_MTD, dbo.Visits.boCloses_MTD, dbo.Visits.boGoal, 
                         dbo.Visits.partsSales_MTD, dbo.Visits.partsGoal_MTD, dbo.Visits.ServiceSales_MTD, dbo.Visits.serviceGoal_MTD, dbo.Visits.VisitDate, dbo.Visits.ArrivalTime, dbo.Visits.DepartureTime, dbo.Visits.Displays, 
                         dbo.Visits.Cleanliness_Organization, dbo.Visits.StaffingReview, dbo.Stores.StoreName
FROM            dbo.Visits INNER JOIN
                         dbo.Managers ON dbo.Visits.Manager = dbo.Managers.id INNER JOIN
                         dbo.Stores ON dbo.Visits.Store = dbo.Stores.id
GO
/****** Object:  Table [dbo].[CustomerIssues]    Script Date: 3/6/2018 9:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerIssues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[VisitsId] [int] NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[Issue] [varchar](50) NULL,
	[Resolution] [varchar](50) NULL,
 CONSTRAINT [PK_CustomerIssues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/6/2018 9:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[ContactName] [varchar](50) NULL,
	[ContactTitle] [varchar](50) NULL,
	[Address] [varchar](150) NULL,
	[City] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 3/6/2018 9:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentsAndStores]    Script Date: 3/6/2018 9:09:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentsAndStores](
	[id] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [PK_DepartmentsAndStores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesTrained]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesTrained](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Visits_Id] [int] NOT NULL,
	[EmployeeName] [varchar](500) NULL,
	[TopicsCovered] [varchar](500) NULL,
	[Resolution] [varchar](500) NULL,
 CONSTRAINT [PK_EmployeesTrained] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesGoals]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesGoals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Goal] [money] NULL,
	[DepartmentID] [int] NULL,
	[StoreID] [int] NULL,
	[Closes] [int] NULL,
	[Month] [int] NULL,
 CONSTRAINT [PK__SalesGoa__3213E83F1C1632DA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SampleCustomer]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SampleCustomer](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Type] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecureUsers]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecureUsers](
	[Id] [int] NOT NULL,
	[Email] [varchar](200) NULL,
	[Password] [nvarchar](20) NULL,
	[SecurityLevel] [int] NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[Title] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityLevel]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityLevel](
	[int] [nvarchar](2) NULL,
	[Description] [nvarchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Visits] ADD  CONSTRAINT [DF_Visits_VisitDate]  DEFAULT (getdate()) FOR [VisitDate]
GO
/****** Object:  StoredProcedure [dbo].[FindUserByEmail]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindUserByEmail]
@Email nvarchar(200)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT * from SecureUsers where Email=@Email;

END

GO
/****** Object:  StoredProcedure [dbo].[FindUserByEmailPassword]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FindUserByEmailPassword]
@Email nvarchar(200),
@Password nvarchar(20)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT * from SecureUsers where Email=@Email and Password=@Password;

END
GO
/****** Object:  StoredProcedure [dbo].[FindUserById]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[FindUserById]
@id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT * from SecureUsers where id=@id;

END

GO
/****** Object:  StoredProcedure [dbo].[spDeleteCustomerIssue]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description: Delete all 
-- =============================================
CREATE PROCEDURE [dbo].[spDeleteCustomerIssue]
@id int
AS
BEGIN
Delete from CustomerIssues where id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertCustomerIssues]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description:	Add row to SalesGoals
-- =============================================
CREATE PROCEDURE [dbo].[spInsertCustomerIssues]
	@VisitsId int,
	@CustomerName varchar(50),
	@Issue varchar(50),
	@Resolution varchar(50)
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO CustomerIssues VALUES (@VisitsId, @CustomerName, @Issue, @Resolution)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertEmployeesTrained]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description:	Add row 
-- =============================================
CREATE PROCEDURE [dbo].[spInsertEmployeesTrained]
	@Visits_Id int,
	@EmployeeeName varchar(500),
	@TopicsCovered varchar(500),
	@Resolution varchar(500)
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO EmployeesTrained VALUES (@Visits_Id, @EmployeeeName, @TopicsCovered, @Resolution)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertSalesGoals]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description:	Add row to SalesGoals
-- =============================================
CREATE PROCEDURE [dbo].[spInsertSalesGoals]
	@id int,
	@Goal money,
	@Department int,
	@Closes int,
	@Month int
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO SalesGoals VALUES (@id, @Goal, @Department,@Closes,@Month)
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertVisit]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/2017
-- Description:	Add row to Visits
-- =============================================
CREATE PROCEDURE [dbo].[spInsertVisit]

           @UnitsSold_Today int=0,
           @UnitsSoldGP_Today money=0,
           @UnitsDelivered_MTD int=0,
           @UnitsSoldTotalGP_MTD money=0,
           @ReadyForSaleStatus varchar(max)=null,
           @ModelMix varchar(max)=null,
           @PricingVsAge varchar(max)=null,
           @boCloses_Today int=0,
           @boGrossProfit_Today money=0,
           @boCloses_MTD int=0,
           @boGrossProfit_MTD money=0,
		   @boGoal money=0,
           @partsSales_MTD money=0,
		   @partsGoal_MTD money = 0,
           @ServiceSales_MTD money=0,
		   @serviceGoal_MTD money=0,
           @VisitDate datetime=null,
           @ArrivalTime varchar(50)=null,
           @DepartureTime varchar(50)=null,
           @Displays varchar(max)=null,
           @Cleanliness_Organization varchar(max)=null,
           @StaffingReview varchar(max)=null,
           @store int=0,
           @Manager int=0,
		   @Visitid    INT    OUTPUT
AS
BEGIN

SET NOCOUNT ON;

INSERT INTO [dbo].[Visits]
           ([UnitsSold_Today]
           ,[UnitsSoldGP_Today]
           ,[UnitsDelivered_MTD]
           ,[UnitsSoldTotalGP_MTD]
           ,[ReadyForSaleStatus]
           ,[ModelMix]
           ,[PricingVsAge]
           ,[boCloses_Today]
           ,[boGrossProfit_Today]
           ,[boCloses_MTD]
           ,[boGrossProfit_MTD]
		   ,[boGoal]
           ,[partsSales_MTD]
		   ,[partsGoal_MTD]
           ,[ServiceSales_MTD]
		   ,[serviceGoal_MTD]
           ,[VisitDate]
           ,[ArrivalTime]
           ,[DepartureTime]
           ,[Displays]
           ,[Cleanliness_Organization]
           ,[StaffingReview]
           ,[Store]
           ,[Manager])
     VALUES
           (@UnitsSold_Today,
           @UnitsSoldGP_Today,
           @UnitsDelivered_MTD,
           @UnitsSoldTotalGP_MTD,
           @ReadyForSaleStatus,
           @ModelMix,
           @PricingVsAge,
           @boCloses_Today,
           @boGrossProfit_Today,
           @boCloses_MTD,
           @boGrossProfit_MTD,
		   @boGoal,
           @partsSales_MTD,
		   @partsGoal_MTD,
           @ServiceSales_MTD,
		   @serviceGoal_MTD,
           @VisitDate,
           @ArrivalTime,
           @DepartureTime,
           @Displays,
           @Cleanliness_Organization,
           @StaffingReview,
           @store,
           @Manager
)
END
select @Visitid = SCOPE_IDENTITY()
select @VisitId as id

RETURN
GO
/****** Object:  StoredProcedure [dbo].[spSelectAllVisits]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 3/2/2018
-- Description: Select by id
-- =============================================
CREATE PROCEDURE [dbo].[spSelectAllVisits]
AS
BEGIN
SELECT        dbo.Managers.ManagerFirstName + '  ' + dbo.Managers.ManagerLastName AS ManagerName, Convert(varchar,dbo.Visits.VisitDate,101) as VisitDate, dbo.Stores.StoreName, dbo.Visits.id
FROM            dbo.Visits INNER JOIN
                         dbo.Managers ON dbo.Visits.Manager = dbo.Managers.id INNER JOIN
                         dbo.Stores ON dbo.Visits.Store = dbo.Stores.id 
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectBusOfficeVisits]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 1/22/18
-- Description: Select business office-related visits
-- =============================================
CREATE PROCEDURE [dbo].[spSelectBusOfficeVisits]

AS
BEGIN
--Select id, boCloses_Today, boCloses_MTD, boGrossProfit_MTD, VisitDate, ArrivalTime, DepartureTime, store, storename, Manager from Visits

SELECT        dbo.Visits.boCloses_Today, dbo.Visits.boGrossProfit_Today, dbo.Visits.boCloses_MTD, dbo.Visits.boGrossProfit_MTD, VisitDate, ArrivalTime, DepartureTime, Manager, dbo.Stores.StoreName
FROM            dbo.Stores RIGHT OUTER JOIN
                         dbo.Visits ON dbo.Stores.id = dbo.Visits.store
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectCustomerIssues]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description: Select all 
-- =============================================
CREATE PROCEDURE [dbo].[spSelectCustomerIssues]

AS
BEGIN
Select * from CustomerIssues 
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectManagers]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectManagers]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id, ManagerFirstName+' '+ManagerLastName as ManagerName from Managers
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectPartsVisits]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 1/22/18
-- Description: Select parts-related visits
-- =============================================
CREATE PROCEDURE [dbo].[spSelectPartsVisits]

AS
BEGIN
Select id, partsSales_MTD, VisitDate, ArrivalTime, DepartureTime, store, Manager from Visits
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectSalesGoals]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description: Select all
-- =============================================
CREATE PROCEDURE [dbo].[spSelectSalesGoals]

AS
BEGIN
SELECT        dbo.Departments.DepartmentName, dbo.SalesGoals.id, dbo.SalesGoals.Goal, dbo.SalesGoals.DepartmentID, dbo.SalesGoals.StoreID, dbo.SalesGoals.Closes, dbo.SalesGoals.[Month], dbo.Stores.StoreName
FROM            dbo.Departments INNER JOIN
                         dbo.SalesGoals ON dbo.Departments.id = dbo.SalesGoals.DepartmentID INNER JOIN
                         dbo.Stores ON dbo.Stores.id = dbo.SalesGoals.StoreID
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectSalesVisits]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description: Select sales-related visits
-- =============================================
CREATE PROCEDURE [dbo].[spSelectSalesVisits]

AS
BEGIN
Select id, UnitsSold_Today, UnitsSoldGP_Today, UnitsDelivered_MTD, UnitsSoldTotalGP_MTD, ReadyForSaleStatus,ModelMix,PricingVsAge,
 VisitDate, ArrivalTime, DepartureTime, store, Manager from Visits
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectServiceVisits]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 1/22/18
-- Description: Select service-related visits
-- =============================================
CREATE PROCEDURE [dbo].[spSelectServiceVisits]

AS
BEGIN
Select id, ServiceSales_MTD, VisitDate, ArrivalTime, DepartureTime, store, Manager from Visits
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectSingleCustomerIssue]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description: Select by id
-- =============================================
CREATE PROCEDURE [dbo].[spSelectSingleCustomerIssue]
@id int
AS
BEGIN
Select * from CustomerIssues where id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectSingleSalesGoal]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description: Select by id
-- =============================================
CREATE PROCEDURE [dbo].[spSelectSingleSalesGoal]
@id int
AS
BEGIN
Select * from SalesGoals where id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectSingleVisit]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description: Select by id
-- =============================================
CREATE PROCEDURE [dbo].[spSelectSingleVisit]
@id int
AS
BEGIN
SELECT      id , UnitsSold_Today, UnitsSoldGP_Today, UnitsDelivered_MTD, UnitsSoldTotalGP_MTD, ReadyForSaleStatus, ModelMix, PricingVsAge, boCloses_Today, boGrossProfit_Today, boCloses_MTD, boGrossProfit_MTD, 
                         boGoal, partsSales_MTD, partsGoal_MTD, ServiceSales_MTD, serviceGoal_MTD, Convert(varchar,dbo.Visits.VisitDate,101) as VisitDate, ArrivalTime, DepartureTime, Displays, Cleanliness_Organization, StaffingReview, Store, Manager
FROM           dbo.Visits where id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectStores]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 3/1/2018
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectStores]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Stores
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectVisitDates]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSelectVisitDates]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT VisitDate from Visits;
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectVisits]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia
-- Create date: 12/3/17
-- Description: Select all
-- =============================================
CREATE PROCEDURE [dbo].[spSelectVisits]
@store int,
@Manager int,
@VisitDate datetime
AS
BEGIN
SELECT        dbo.Managers.ManagerFirstName + '  ' + dbo.Managers.ManagerLastName AS ManagerName, dbo.Visits.UnitsSold_Today, dbo.Visits.UnitsSoldGP_Today, dbo.Visits.UnitsDelivered_MTD, dbo.Visits.UnitsSoldTotalGP_MTD, 
                         dbo.Visits.ReadyForSaleStatus, dbo.Visits.ModelMix, dbo.Visits.PricingVsAge, dbo.Visits.boCloses_Today, dbo.Visits.boGrossProfit_Today, dbo.Visits.boGrossProfit_MTD, dbo.Visits.boCloses_MTD, dbo.Visits.boGoal, 
                         dbo.Visits.partsSales_MTD, dbo.Visits.partsGoal_MTD, dbo.Visits.ServiceSales_MTD, dbo.Visits.serviceGoal_MTD, dbo.Visits.VisitDate, dbo.Visits.ArrivalTime, dbo.Visits.DepartureTime, dbo.Visits.Displays, 
                         dbo.Visits.Cleanliness_Organization, dbo.Visits.StaffingReview, dbo.Stores.StoreName, dbo.Visits.id
FROM            dbo.Visits INNER JOIN
                         dbo.Managers ON dbo.Visits.Manager = dbo.Managers.id INNER JOIN
                         dbo.Stores ON dbo.Visits.Store = dbo.Stores.id
WHERE store=@store and Manager=@Manager and VisitDate>Convert(date,@VisitDate)and VisitDate<DateAdd(day,1,Convert(date,@VisitDate))

END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmployeesTrained]    Script Date: 3/6/2018 9:09:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcia, @EmployeeeName, @TopicsCovered, @Resolution)
-- Create date: 12/3/17
-- Description:	Add row 
-- =============================================
CREATE PROCEDURE [dbo].[spUpdateEmployeesTrained]
@Id int,
	@Visits_Id int,
	@EmployeeName varchar(500),
	@TopicsCovered varchar(500),
	@Resolution varchar(500)
AS
BEGIN


	Update EmployeesTrained SET
	EmployeeName = @EmployeeName,
	TopicsCovered = @TopicsCovered,
	Resolution = @Resolution,
	Visits_Id=@Visits_Id
	WHERE id=@id
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Managers"
            Begin Extent = 
               Top = 124
               Left = 234
               Bottom = 254
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Visits"
            Begin Extent = 
               Top = 6
               Left = 488
               Bottom = 136
               Right = 709
            End
            DisplayFlags = 280
            TopColumn = 21
         End
         Begin Table = "Stores"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [rovingGM] SET  READ_WRITE 
GO
