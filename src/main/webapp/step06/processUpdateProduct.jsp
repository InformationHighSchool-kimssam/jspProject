<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%> <!-- Enumeration 클래스 가져오기 -->
<%-- <%@ page import="java.sql.*"%> --%>
<%@ include file="dbconn.jsp" %>
<!-- 16-21)processAddProduct.jsp와 유사함 -->
<%
	String filename = "";
	String realFolder = application.getRealPath("/resources/images/"); //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
	new DefaultFileRenamePolicy());
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");

	Integer price;

	if (unitPrice.isEmpty()) price = 0;
	else price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty()) stock = 0;
	else stock = Long.valueOf(unitsInStock);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);

	/*product table에서 p_id필드값과 일치하는 값을 가져오도록 select구문을 작성 */
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();

	if (rs.next()) { //가져온 레코드가 있으면
		if (fileName != null) { //요청 파라미터 중에서 이미지 파일이 있으면 이미지를 포함한 컬럼명을 활용하여 속성값을 사용자가 입력한 multi객체를 통해서 얻어온 데이터로 수정함
	sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=?, p_fileName=? WHERE p_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setInt(2, price);
	pstmt.setString(3, description);
	pstmt.setString(4, manufacturer);
	pstmt.setString(5, category);
	pstmt.setLong(6, stock);
	pstmt.setString(7, condition);
	pstmt.setString(8, fileName);
	pstmt.setString(9, productId);
	pstmt.executeUpdate();
	} else { //요청 파라미터에 이미지 파일이 없으면 이미지 파일을 제외한 컬럼명을 활용하여 나머지 데이터를 수정함
	sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=? WHERE p_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setInt(2, price);
	pstmt.setString(3, description);
	pstmt.setString(4, manufacturer);
	pstmt.setString(5, category);
	pstmt.setLong(6, stock);
	pstmt.setString(7, condition);
	pstmt.setString(8, productId);
	pstmt.executeUpdate();
		}
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	/* 16-23)수정을 완료하면 editProduct.jsp페이지로 edit=update 매개변수를 포함하여 이동함=>editProduct.jsp?edit=delete 페이지에서 상품 삭제 버튼 클릭후 삭제를 처리할 deleteProduct.jsp를 생성하여 이동*/
	response.sendRedirect("index.jsp?edit=update");
%>


