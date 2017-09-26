-- 簡易受注検索
select tour.itemcode
from (orderdetail inner join tour on orderdetail.itemcode = tour.itemcode)
union
select hotel.itemcode
from (orderdetail inner join hotel on orderdetail.itemcode = hotel.itemcode)
union
select flight.itemcode
from (orderdetail inner join flight on orderdetail.itemcode = flight.itemcode)

-- 月別集計
select ordermaster.MemberCode, ordermaster.OrderDate, member.Name, ordermaster.OrderTotal
from ordermaster, member where ordermaster.MemberCode = member.MemberCode and
ordermaster.OrderDate like '%2016-01%'

-- パッケージツアー販売商品一覧取得
select tour.itemcode, tourmaster.name as itemname, destination.name as destinationname, tourmaster.days, tourmaster.nights,
tour.Date, tour.price, tour.firsthotelitemcode, tour.outwardflightitemcode, tour.homewardflightitemcode, tour.stock,
tourmaster.basicprice, tourmaster.hotelcode, tourmaster.outwardflightcode, tourmaster.homewardflightcode,
categorycode, categoryname, tourmaster.tourcode
from (( tour inner join tourmaster on tour.tourcode = tourmaster.tourcode )
inner join destination on tourmaster.destinationcode = destination.destinationcode),
category where substr(tour.itemcode from 1 for 3) = category.categorycode
and destination.name="九州" and substr(tour.Date from 1 for 7) = "2016-01";

select tour.itemcode, tourmaster.name as itemname, destination.name as destinationname, tourmaster.days, tourmaster.nights,
tour.Date, extract(year_month from tour.Date) as ym, tour.price, tour.firsthotelitemcode, tour.outwardflightitemcode, tour.homewardflightitemcode, tour.stock,
tourmaster.basicprice, tourmaster.hotelcode, tourmaster.outwardflightcode, tourmaster.homewardflightcode,
categorycode, categoryname, tourmaster.tourcode
from (( tour inner join tourmaster on tour.tourcode = tourmaster.tourcode )
inner join destination on tourmaster.destinationcode = destination.destinationcode),
category where substr(tour.itemcode from 1 for 3) = category.categorycode
and destination.name="九州" and extract(year_month from tour.Date) = '201601';

select tour.itemcode, tourmaster.name as itemname, destination.name as destinationname, tourmaster.days, tourmaster.nights,
tour.Date, date_format(tour.Date, '%y%m') as ym,
tour.price, tour.firsthotelitemcode, tour.outwardflightitemcode, tour.homewardflightitemcode, tour.stock,
tourmaster.basicprice, tourmaster.hotelcode, tourmaster.outwardflightcode, tourmaster.homewardflightcode,
categorycode, categoryname, tourmaster.tourcode
from (( tour inner join tourmaster on tour.tourcode = tourmaster.tourcode )
inner join destination on tourmaster.destinationcode = destination.destinationcode),
category where substr(tour.itemcode from 1 for 3) = category.categorycode
and destination.name="九州" and  date_format(tour.Date, '%y%m') = '1601';

--採用
select tour.itemcode, tourmaster.name as itemname, destination.destinationcode, destination.name as destinationname,
tourmaster.days, tourmaster.nights, tour.Date, date_format(tour.Date, '%y%m') as ym,
tour.price, tour.firsthotelitemcode, tour.outwardflightitemcode, tour.homewardflightitemcode, tour.stock,
tourmaster.basicprice, tourmaster.hotelcode, tourmaster.outwardflightcode, tourmaster.homewardflightcode,
categorycode, categoryname, tourmaster.tourcode
from (( tour inner join tourmaster on tour.tourcode = tourmaster.tourcode )
inner join destination on tourmaster.destinationcode = destination.destinationcode),
category where substr(tour.itemcode from 1 for 3) = category.categorycode
and destination.destinationcode='07' and  date_format(tour.Date, '%y%m') = '1601';


-- パッケージツアー商品詳細情報の１件取得
select tour.itemcode, tourmaster.name as itemname, destination.name as destinationname, tourmaster.days, tourmaster.nights,
tour.Date, tour.price, tour.firsthotelitemcode, tour.outwardflightitemcode, tour.homewardflightitemcode, tour.stock,
tourmaster.basicprice, tourmaster.hotelcode, tourmaster.outwardflightcode, tourmaster.homewardflightcode,
categorycode, categoryname, tourmaster.tourcode
from (( tour inner join tourmaster on tour.tourcode = tourmaster.tourcode )
inner join destination on tourmaster.destinationcode = destination.destinationcode),
category where substr(tour.itemcode from 1 for 3) = category.categorycode
and tour.itemcode = 'TOR000001';


-- メンバーコードに対する注文情報の表示
select orderno, orderdate, ordertotal, ordermaster.membercode, payment
from OrderMaster inner join Member on member.membercode = ordermaster.membercode where member.membercode = "CM0001";

-- DAOに書くsqlコード
select orderno, orderdate, ordertotal, ordermaster.membercode, payment
from OrderMaster inner join Member on member.membercode = ordermaster.membercode where member.membercode = ?;


-- 注文取消画面で表示する注文情報
select orderdetail.orderno, tour.itemcode, tourmaster.name, orderdetail.price, orderdetail.quantity, (orderdetail.price*orderdetail.quantity) as subtotal
from (orderdetail inner join tour on orderdetail.itemcode = tour.itemcode)
inner join tourmaster on tour.tourcode = tourmaster.tourcode
where orderdetail.orderno = 1
union
select orderdetail.orderno, hotel.itemcode, hotelmaster.name, orderdetail.price, orderdetail.quantity, (orderdetail.price*orderdetail.quantity) as subtotal
from (orderdetail inner join hotel on orderdetail.itemcode = hotel.itemcode)
inner join hotelmaster on hotel.hotelcode = hotelmaster.hotelcode
where orderdetail.orderno = 1
union
select orderdetail.orderno, flight.itemcode, flightmaster.flightcode, orderdetail.price, orderdetail.quantity, (orderdetail.price*orderdetail.quantity) as subtotal
from (orderdetail inner join flight on orderdetail.itemcode = flight.itemcode)
inner join flightmaster on flight.flightcode = flightmaster.flightcode
where orderdetail.orderno = 1
order by price desc;

-- 商品別受注集計（全件表示）
select ordermaster.membercode, orderdetail.orderno, tour.itemcode, tourmaster.name,
orderdetail.price, orderdetail.quantity,
(orderdetail.price*orderdetail.quantity) as subtotal
from ((orderdetail inner join tour on orderdetail.itemcode = tour.itemcode)
inner join tourmaster on tour.tourcode = tourmaster.tourcode)
inner join ordermaster on orderdetail.orderno = ordermaster.orderno where orderdetail.orderno = 1
union
select ordermaster.membercode, orderdetail.orderno, hotel.itemcode, hotelmaster.name,
orderdetail.price, orderdetail.quantity,
(orderdetail.price*orderdetail.quantity) as subtotal
from ((orderdetail inner join hotel on orderdetail.itemcode = hotel.itemcode)
inner join hotelmaster on hotel.hotelcode = hotelmaster.hotelcode)
inner join ordermaster on orderdetail.orderno = ordermaster.orderno where orderdetail.orderno = 1
union
select ordermaster.membercode, orderdetail.orderno, flight.itemcode, flightmaster.flightcode,
orderdetail.price, orderdetail.quantity,
(orderdetail.price*orderdetail.quantity) as subtotal
from ((orderdetail inner join flight on orderdetail.itemcode = flight.itemcode)
inner join flightmaster on flight.flightcode = flightmaster.flightcode)
inner join ordermaster on orderdetail.orderno = ordermaster.orderno where orderdetail.orderno = 1
order by price desc, itemcode, membercode;

-- 商品別受注集計（メンバーコード検索）
select ordermaster.membercode, orderdetail.orderno, tour.itemcode, tourmaster.name,
orderdetail.price, orderdetail.quantity,
(orderdetail.price*orderdetail.quantity) as subtotal
from ((orderdetail inner join tour on orderdetail.itemcode = tour.itemcode)
inner join tourmaster on tour.tourcode = tourmaster.tourcode)
inner join ordermaster on orderdetail.orderno = ordermaster.orderno where ordermaster.membercode = 'CM0001'
union
select ordermaster.membercode, orderdetail.orderno, hotel.itemcode, hotelmaster.name,
orderdetail.price, orderdetail.quantity,
(orderdetail.price*orderdetail.quantity) as subtotal
from ((orderdetail inner join hotel on orderdetail.itemcode = hotel.itemcode)
inner join hotelmaster on hotel.hotelcode = hotelmaster.hotelcode)
inner join ordermaster on orderdetail.orderno = ordermaster.orderno where ordermaster.membercode = 'CM0001'
union
select ordermaster.membercode, orderdetail.orderno, flight.itemcode, flightmaster.flightcode,
orderdetail.price, orderdetail.quantity,
(orderdetail.price*orderdetail.quantity) as subtotal
from ((orderdetail inner join flight on orderdetail.itemcode = flight.itemcode)
inner join flightmaster on flight.flightcode = flightmaster.flightcode)
inner join ordermaster on orderdetail.orderno = ordermaster.orderno where ordermaster.membercode = 'CM0001'
order by price desc, itemcode, membercode;


-- 途中
select tour.itemcode, tourmaster.name as tourname, destination.name as destinationname, tourmaster.days, tourmaster.nights,
tour.Date, tour.price, hotelmaster.name as hotelname, flightmaster.flightcode, tour.homewardflightitemcode, tour.stock,
tourmaster.basicprice, tourmaster.hotelcode, tourmaster.outwardflightcode, tourmaster.homewardflightcode,
categorycode, categoryname, tourmaster.tourcode
from (((((( tour inner join tourmaster on tour.tourcode = tourmaster.tourcode )
inner join destination on tourmaster.destinationcode = destination.destinationcode)
inner join hotel on tour.firsthotelitemcode = hotel.itemcode)
inner join hotelmaster on hotel.hotelcode = hotelmaster.hotelcode)
inner join flight on tour.outwardflightcode = flight.itemcode)
inner join flightmaster on flight.flightcode = flightmaster.flightcode)
inner join flightmaster on airport.airportcode = flightmaster.departureairportcode
,category where substr(tour.itemcode from 1 for 3) = category.categorycode
and tour.itemcode = 'TOR000001';
