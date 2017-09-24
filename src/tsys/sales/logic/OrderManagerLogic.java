package tsys.sales.logic;

import java.sql.Connection;
import java.sql.SQLException;

import tsys.sales.dao.MemberDAO;
import tsys.sales.dao.OrderDetailDAO;
import tsys.sales.dao.OrderMasterDAO;
import tsys.sales.entity.Member;
import tsys.sales.entity.Order;
import tsys.sales.entity.OrderDetail;
import tsys.sales.dao.ConnectionManager;

public class OrderManagerLogic {


	public boolean insertOrder() throws SalesBusinessException{

		boolean insertCheck = true;
		Connection con = null;
		con = ConnectionManager.getConnection();
		try {
			OrderMasterDAO omdao = new OrderMasterDAO(con);
			OrderDetailDAO oddao = new OrderDetailDAO(con);

			// テストデータ変数宣言
			Order order = new Order();
			int orderTotal;
			String memberCode;
			String payment;
			orderTotal = 10000; // 適切に作成
			memberCode = "CMYYYY"; // 適切に作成
			payment = "01"; // 適切に作成
			order.setOrderTotal(orderTotal);
			order.setMemberCode(memberCode);
			order.setPayment(payment);
			insertCheck = omdao.insertOrderMaster(order);
			if(insertCheck == false){
				System.out.println("insertOrderMaster　失敗");
			}

			// テストデータ変数宣言
			OrderDetail orderDetail = new OrderDetail();
			String itemCode;
			int price;
			int quantity;
			// テストデータ作成
			itemCode = "FLY000138";
			price = 13000;
			quantity = 1;
			orderDetail.setItemCode(itemCode);
			orderDetail.setPrice(price);
			orderDetail.setQuantity(quantity);
			insertCheck = oddao.insertOrderDetail(orderDetail);
			System.out.println(insertCheck);

		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		return true;
	}
}
