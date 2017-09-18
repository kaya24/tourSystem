package tsys.sales.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import tsys.sales.entity.OrderDetail;

public class FormatDAO {

	/** 接続オブジェクトを保持する変数 */
	Connection con;

	/**
	 * コンストラクタ
	 * @param con
	 */
	public FormatDAO(Connection con) {
		this.con = con;
	}

	/**
	 * 引数から取得した商品別注文情報を、OrderDetailテーブルの新規レコードに挿入し、 処理判定結果(boolean)を返却する。
	 *
	 * @param orderDetail
	 *            商品別注文情報
	 * @return 処理判定結果
	 * @throws SQLException
	 */
	public boolean insertOrderDetail(OrderDetail orderDetail)
			throws SQLException {

		// 処理判定結果のための変数宣言
		boolean insertCheck = false;

		String sql = "insert into orderdetail (OrderNo, ItemCode, Price, Quantity) "
				+ "values ((select last_insert_id()), ?, ?, ?)";

		PreparedStatement stmt = null;
		ResultSet res = null;

		try {
			stmt = con.prepareStatement(sql);
			// 以下の値を設定する。
			stmt.setString(1, orderDetail.getItemCode());
			stmt.setInt(2, orderDetail.getPrice());
			stmt.setInt(3, orderDetail.getQuantity());

			// SQLを実行する。
			int count = stmt.executeUpdate();

			// 更新数が1のとき、insertCheckをtrueに更新する。
			if(count == 1){
				insertCheck = true;
			}

		} finally {
			if (res != null) {
				res.close();
			}
			if (stmt != null) {
				stmt.close();
			}
		}

		return insertCheck;
	}
}
