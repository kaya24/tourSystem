<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/tourSystem/css/common.css">
  <link rel="stylesheet" href="/tourSystem/css/menubar-cust.css">
  <link rel="stylesheet" href="/tourSystem/css/button.css">
  <link rel="stylesheet" href="/tourSystem/css/table.css">

	<form method="post" action="/tourSystem/FrontCont">
	<input type="hidden" name="BUTTON_ID" value="">

	<c:if test="${empty CommonLoginMember}">
      <!--ヘッダー部分-->
         <div id="header">
        <div id="boxA">
          <a href="/tourSystem/FrontCont?BUTTON_ID=BC000Logo">
            FLMTours
          </a>
        </div>
              <div id="nav">
                <ul>
                  <li>ようこそ、FLMToursへ</li>
                  <li><a href="#">新規会員登録</a></li>
                  <li><a href="#">注文内容／キャンセル</a></li>
                  <li><a href="/tourSystem/FrontCont?BUTTON_ID=BC000Login">ログイン</a></li>
                  <li><a href="/tourSystem/FrontCont?BUTTON_ID=BC000Logout">セッションリセット</a></li>
                </ul>
            </div>
      </div>
	</c:if>

	<c:if test="${!empty CommonLoginMember}">
      <!--ヘッダー部分-->
         <div id="header">
        <div id="boxA">
          <a href="/tourSystem/FrontCont?BUTTON_ID=BC001CustTop">
            FLMTours
          </a>
        </div>
              <div id="nav">
                <ul>
	              <li>こんにちは　<c:out value="${CommonLoginMember.memberName}"></c:out>さん</li>
                  <li><a href="#">会員情報照会</a></li>
                  <li><a href="#">注文内容／キャンセル</a></li>
                  <li><a href="/tourSystem/FrontCont?BUTTON_ID=BC000Logout">ログアウト</a></li>
                </ul>
            </div>
      </div>
	</c:if>

      <ul id="dropmenu">
          <li><a href="/tourSystem/FrontCont?BUTTON_ID=BC001PackageTour">パッケージツアー</a>
        </li>

        <li><a href="#">航空券</a>
        </li>

        <li><a href="#">ホテル</a>
        </li>

        <li><a href="/tourSystem/FrontCont?BUTTON_ID=BC000ShoppingCart">ショッピングカート</a>
        </li>

        </ul>

</form>
