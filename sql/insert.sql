use tourdb;

delete from Member;
insert into tourdb.Member values('CM0001', '佐藤ハナコ', 'pass', 'Customer', 'hanako@aaa.com', '108-6112', '東京都', '港区港南', '03-3333-1234');
insert into tourdb.Member values('CM0002', '鈴木イチロウ', 'pass', 'Customer', 'ichirow@mephone.org', '108-6112', '東京都', '港区港南', '03-3333-4455');
insert into tourdb.Member values('543210', '古田誠', 'pwd', 'Employee', 'furuta.makoto@flmtours.co.jp', NULL, NULL, NULL, NULL);

delete from Tour;
insert into tourdb.Tour values('TOR000001', '000001', '2016-1-20', 25000, 'HTL000001', 'FLY000001', 'FLY000138', 8);
insert into tourdb.Tour values('TOR000002', '000001', '2016-1-25', 25000, 'HTL000005', 'FLY000453', 'FLY000567', 8);
insert into tourdb.Tour values('TOR000003', '000003', '2016-1-27', 65000, 'HTL000732', 'FLY000690', 'FLY000749', 8);

delete from TourMaster;
insert into tourdb.TourMaster values('000001', '博多グルメ食べつくしツアー', '07', 3, 2, 25000, 'FKO001', 'ANA247', 'ANA268');
insert into tourdb.TourMaster values('000002', '博多フリープラン2泊3日の旅', '07', 3, 2, 23000, 'FKO001', 'ANA245', 'ANA268');
insert into tourdb.TourMaster values('000003', 'いい旅九州5つ星ホテルの旅', '07', 4, 3, 65000, 'FKO002', 'JAL305', 'JAL332');

delete from Destination;
insert into tourdb.Destination values('01', '北海道');
insert into tourdb.Destination values('02', '東北');
insert into tourdb.Destination values('03', '関東');
insert into tourdb.Destination values('04', '中部');
insert into tourdb.Destination values('05', '近畿');
insert into tourdb.Destination values('06', '四国');
insert into tourdb.Destination values('07', '九州');
insert into tourdb.Destination values('08', '沖縄');

delete from Hotel;
insert into tourdb.Hotel values('HTL000001', 'FKO001', '2016-01-20', 15000, 15);
insert into tourdb.Hotel values('HTL000002', 'FKO001', '2016-01-21', 15000, 15);
insert into tourdb.Hotel values('HTL000003', 'FKO001', '2016-01-22', 15000, 15);
insert into tourdb.Hotel values('HTL000004', 'FKO001', '2016-01-23', 15000, 15);
insert into tourdb.Hotel values('HTL000005', 'FKO001', '2016-01-24', 15000, 15);
insert into tourdb.Hotel values('HTL000006', 'FKO001', '2016-01-25', 15000, 15);

delete from HotelMaster;
insert into tourdb.HotelMaster values('FKO001', '福岡プリンセスホテル', '04', '5', 15000);
insert into tourdb.HotelMaster values('FKO002', 'アサトンタワーホテル　博多', '04', '5', 15000);
insert into tourdb.HotelMaster values('FKO003', '福岡ニューパシフィックホテル', '04', '5', 15000);

delete from City;
insert into tourdb.City values('01', '札幌');
insert into tourdb.City values('02', '旭川');
insert into tourdb.City values('03', '函館');
insert into tourdb.City values('04', '福岡');
insert into tourdb.City values('05', '鹿児島');
insert into tourdb.City values('06', '那覇');

delete from Flight;
insert into tourdb.Flight values('FLY000001', 'ADO013', '2016-01-20', 13000, 15);
insert into tourdb.Flight values('FLY000002', 'ADO013', '2016-01-21', 13000, 15);
insert into tourdb.Flight values('FLY000003', 'ADO013', '2016-01-22', 13000, 15);
insert into tourdb.Flight values('FLY000004', 'ADO013', '2016-01-23', 13000, 15);
insert into tourdb.Flight values('FLY000005', 'ADO013', '2016-01-24', 13000, 15);
insert into tourdb.Flight values('FLY000006', 'ADO013', '2016-01-25', 13000, 15);
insert into tourdb.Flight values('FLY000007', 'ADO013', '2016-01-26', 13000, 15);
insert into tourdb.Flight values('FLY000008', 'ADO013', '2016-01-27', 13000, 15);
insert into tourdb.Flight values('FLY000732', 'ADO013', '2016-01-28', 13000, 15);
insert into tourdb.Flight values('FLY000733', 'ADO013', '2016-01-29', 13000, 15);

delete from FlightMaster;
insert into tourdb.FlightMaster values('ADO013', '07:45:00', '09:20:00', 'HND', 'CTS', 13000);
insert into tourdb.FlightMaster values('ADO014', '09:50:00', '11:30:00', 'HND', 'CTS', 13000);

delete from Airport;
insert into tourdb.Airport values('AKJ', '旭川空港');
insert into tourdb.Airport values('CTS', '新千歳空港');
insert into tourdb.Airport values('FUK', '福岡空港');
insert into tourdb.Airport values('HKD', '函館空港');
insert into tourdb.Airport values('HND', '羽田空港');
insert into tourdb.Airport values('KOJ', '鹿児島空港');
insert into tourdb.Airport values('OKA', '那覇空港');
insert into tourdb.Airport values('SHM', '南紅白浜空港');

delete from OrderMaster;
insert into tourdb.OrderMaster(OrderDate, OrderTotal, MemberCode, Payment) values ('2016-01-25', 30000, 'CM0001', '01');
insert into tourdb.OrderMaster(OrderDate, OrderTotal, MemberCode, Payment) values ('2016-01-27', 15000, 'CM0001', '02');
insert into tourdb.OrderMaster(OrderDate, OrderTotal, MemberCode, Payment) values ('2016-01-27', 15000, 'CM0002', '02');

delete from OrderDetail;
insert into tourdb.OrderDetail values (1, 'HTL000005', 15000, 1);
insert into tourdb.OrderDetail values (1, 'HTL000006', 15000, 1);
insert into tourdb.OrderDetail values (2, 'FLY000732', 15000, 1);
insert into tourdb.OrderDetail values (1, 'FLY000732', 15000, 1);
insert into tourdb.OrderDetail values (1, 'TOR000001', 25000, 2);

delete from Category;
insert into tourdb.Category values (1, 'HTL', 'ホテル');
insert into tourdb.Category values (2, 'TOR', 'ツアー');
insert into tourdb.Category values (3, 'FLY', '航空便');

commit;