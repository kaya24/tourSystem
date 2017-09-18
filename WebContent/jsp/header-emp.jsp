<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="/tourSystem/css/common.css">
  <link rel="stylesheet" href="/tourSystem/css/menubar-emp.css">
  <link rel="stylesheet" href="/tourSystem/css/table.css">

</head>
<body>
   <div id="page">
      <!--ヘッダー部分-->
 <div id="header">
      <div id="boxA">
        販売管理システム
      </div>

        <div id="boxB">
        <table>
          <tr>
            <td>ログイン日時</td><td>：</td>
            <td>YYYY-MM-DD-何時何分何秒</td>
          </tr>
          <tr>
            <td>従業員コード</td><td>：</td>
            <td>999999</td>
          </tr>
          <tr>
            <td>従業員氏名</td><td>：</td>
            <td>山田太郎</td>
          </tr>
        </table>
      </div>
      <div id="nav">
        <ul>
          <li><a href="#">メインメニュー</a></li>
          <li><a href="#">注文内容確認</a></li>
          <li><a href="#">ログアウト</a></li>
        </ul>
      </div>
    </div>

      <ul id="dropmenu">
        <li><a href="#">商品管理業務</a>
          <ul>
            <li><a href="#">パッケージツアー管理</a>
              <ul>
                <li><a href="#">パッケージツアー／登録</a></li>
                <li><a href="#">パッケージツアー／削除</a>
                <li><a href="#">パッケージツアー／変更</a>
                <li><a href="#">パッケージツアー／一覧</a></li>
              </ul>
            </li>
            <li><a href="#">航空券管理</a>
              <ul>
                <li><a href="#">航空券／登録</a></li>
                <li><a href="#">航空券／削除</a></li>
                <li><a href="#">航空券／変更</a></li>
                <li><a href="#">航空券／一覧</a></li>
              </ul>
            </li>
            <li><a href="#">ホテル管理</a>
              <ul>
                <li><a href="#">ホテル／登録</a></li>
                <li><a href="#">ホテル／削除</a></li>
                <li><a href="#">ホテル／変更</a>
                </li>
              </ul>
            </li>
          </ul>
        </li>

        <li><a href="#">商品販売業務</a>
          <ul>
            <li><a href="#">パッケージツアー販売</a>
              <ul>
                <li><a href="#">パッケージツアー／購入</a></li>
                <li><a href="#">パッケージツアー／キャンセル</a>
              </ul>
            </li>
            <li><a href="#">航空券販売</a>
              <ul>
                <li><a href="#">航空券／購入</a></li>
                <li><a href="#">航空券／キャンセル</a></li>
              </ul>
            </li>
            <li><a href="#">ホテル販売</a>
              <ul>
                <li><a href="#">ホテル／予約</a></li>
                <li><a href="#">ホテル／キャンセル</a></li>
              </ul>
            </li>
          </ul>
        </li>

        <li><a href="#">メンバー管理業務</a>
          <ul>
            <li><a href="#">メンバー登録</a></li>
            <li><a href="#">メンバー変更</a></li>
            <li><a href="#">メンバー一覧</a></li>
          </ul>
        </li>

        <li><a href="#">集計業務</a>
          <ul>
            <li><a href="/tourSystem/FrontCont?BUTTON_ID=table-test">月別受注集計</a></li>
            <li><a href="#">年別受注集計</a></li>
            <li><a href="#">商品別受注集計</a></li>
          </ul>
          </li>
      </ul>
</body>
</html>