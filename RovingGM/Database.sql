USE [master]
GO

/****** Object:  Database [rovingGM]    Script Date: 1/24/2018 10:43:44 PM ******/
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

ALTER DATABASE [rovingGM] SET  READ_WRITE 
GO

