package tsys.sales.dao.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import tsys.sales.dao.ConnectionManager;
import tsys.sales.dao.OrderMasterDAO;
import tsys.sales.dao.PackageTourDAO;
import tsys.sales.entity.Aggregate;
import tsys.sales.entity.PackageTour;

public class TestOrderMasterDAO {

	public static void main(String[] args) {

		Connection con = null;
		con = ConnectionManager.getConnection();

		try {

			/*DAO生成テスト*/
			OrderMasterDAO omdao = new OrderMasterDAO(con);
			System.out.println("OrderMasterDAOの生成テスト：OK");

			/*商品一覧取得テスト*/
			ArrayList<Aggregate> aggregateYearList = new ArrayList<Aggregate>();
			String year = "2016";
			String month = "01";

			aggregateYearList = omdao.getMonthOrderAggregate(year, month);
			if (aggregateYearList.size() == 0) {
				System.out.println("月別集計がありません");
				System.out.println("取得できない環境であれば，OK");
			} else {
				System.out.println("月別集計情報が表示されていたら，OK");
				for (Aggregate a : aggregateYearList) {
					System.out.println(a.getMemberCode());
					System.out.println(a.getMemberName());
					System.out.println(a.getTotal());
					System.out.println("-----------------------------");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
			}
		}

	}
}
