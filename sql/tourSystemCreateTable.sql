use tourdb;
DROP TABLE IF EXISTS Member, Tour, TourMaster, Destination, Hotel, HotelMaster, City, Flight, FlightMaster, Airport, OrderMaster, OrderDetail, Category;

-- Memberテーブルの作成
create table tourdb.Member(
	MemberCode varchar(6) primary key,
	Name varchar(20),
	Password varchar(15),
	Role varchar(15),
	Mail varchar(100),
	Zipcode varchar(8),
	Prefecture varchar(8),
	Address varchar(50),
	Tel varchar(13)
)engine=InnoDB;

-- Tourテーブルの作成の作成
create table tourdb.Tour(
	ItemCode varchar(9) primary key,
	TourCode varchar(6),
	Date date,
	Price int,
	FirstHotelItemCode varchar(9),
	OutwardFlightItemCode varchar(9),
	HomewardFlightItemCode varchar(9),
	Stock int
) engine=InnoDB;

-- TourMaseterテーブルの作成
create table tourdb.TourMaster(
	TourCode varchar(6) primary key,
	Name varchar(50),
	DestinationCode varchar(2),
	Days int,
	Nights int,
	BasicPrice int,
	HotelCode varchar(6),
	OutwardFlightCode varchar(6),
	HomewardFlightCode varchar(6)
) engine=InnoDB;

-- Destinationテーブルの作成
create table tourdb.Destination(
	DestinationCode varchar(2) primary key,
	Name varchar(6)
)engine=InnoDB;

-- Hotelテーブルの作成
create table tourdb.Hotel(
	ItemCode varchar(9) primary key,
	HotelCode varchar(6),
	Date date,
	Price int,
	Stock int
) engine=InnoDB;

-- HotelMasterテーブルの作成
create table tourdb.HotelMaster(
	HotelCode varchar(6) primary key,
	Name varchar(30),
	CityCode varchar(2),
	Grade varchar(2),
	BasicPrice int
) engine=InnoDB;

-- Cityテーブルの作成
create table tourdb.City(
	CityCode varchar(2) primary key,
	Name varchar(10)
) engine=InnoDB;

-- Flightテーブルの作成
create table tourdb.Flight(
	ItemCode varchar(9) primary key,
	FlightCode varchar(6),
	Date date,
	Price int,
	Stock int
) engine=InnoDB;

-- FlightMasterテーブルの作成
create table tourdb.FlightMaster(
	FlightCode varchar(6) primary key,
	DepartureTime time,
	ArrivalTime time,
	DepartureAirportCode varchar(3),
	ArrivalAirportCode varchar(3),
	BasicPrice int
) engine=InnoDB;

-- Airportテーブルの作成
create table tourdb.Airport(
	AirportCode varchar(3) primary key,
	Name varchar(10)
) engine=InnoDB;

-- OrderMasterテーブルの作成(なぜか文法エラーになる)
create table tourdb.OrderMaster(
	OrderNo int auto_increment primary key,
	OrderDate date,
	OrderTotal int,
	MemberCode varchar(6),
	Payment varchar(2)
) engine=InnoDB;
alter table ordermaster modify OrderDate datetime;

-- OrderDetailテーブルの作成
create table tourdb.OrderDetail(
	OrderNo int,
	ItemCode varchar(9),
	Price int,
	Quantity int
) engine=InnoDB;
alter table tourdb.OrderDetail add primary key(OrderNo, ItemCode);

-- Categoryテーブルの作成
create table tourdb.Category(
	CategoryNo int primary key,
	CategoryCode varchar(3),
	CategoryName varchar(10)
) engine=InnoDB;
