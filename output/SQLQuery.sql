--DimBranch
CREATE TABLE [dbo].[DimBranch](
	[branch_id] [int] NOT NULL,
	[branch_name] [varchar](50) NULL,
	[branch_location] [varchar](50) NULL,
 CONSTRAINT [PK_branch] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--DimCustomer
CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[CityName] [varchar](50) NULL,
	[StateName] [varchar](50) NULL,
	[Age] [varchar](3) NULL,
	[Gender] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_CustomerID] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


--DimAccount
CREATE TABLE [dbo].[DimAccount](
	[account_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[account_type] [varchar](10) NULL,
	[balance] [int] NULL,
	[date_opened] [datetime2](0) NULL,
	[status] [varchar](10) NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DimAccount]  WITH CHECK ADD  CONSTRAINT [FK_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[DimCustomer] ([CustomerID])
GO

ALTER TABLE [dbo].[DimAccount] CHECK CONSTRAINT [FK_customer_id]



--FactTransaction
CREATE TABLE [dbo].[FactTransaction](
	[transaction_id] [int] NOT NULL,
	[account_id] [int] NULL,
	[transaction_date] [datetime2](0) NULL,
	[amount] [int] NULL,
	[transaction_type] [varchar](50) NULL,
	[branch_id] [int] NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactTransaction]  WITH CHECK ADD  CONSTRAINT [FK_account] FOREIGN KEY([account_id])
REFERENCES [dbo].[DimAccount] ([account_id])
GO

ALTER TABLE [dbo].[FactTransaction] CHECK CONSTRAINT [FK_account]
GO

ALTER TABLE [dbo].[FactTransaction]  WITH CHECK ADD  CONSTRAINT [FK_branch] FOREIGN KEY([branch_id])
REFERENCES [dbo].[DimBranch] ([branch_id])
GO

ALTER TABLE [dbo].[FactTransaction] CHECK CONSTRAINT [FK_branch]
GO
