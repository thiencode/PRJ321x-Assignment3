package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import dao.ListProductDAO;
import model.Product;

/**
 * Servlet implementation class ManagerProduct
 */
@WebServlet("/ManagerProduct")
public class ManagerProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8"); // Vietnamese
		
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("acc");
		
		String indexPage = request.getParameter("index");
		String idP = request.getParameter("idP");
		String action = request.getParameter("action");
		
		
		if(indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		
		//Get total product
		ListProductDAO ld = new ListProductDAO();
		int count = ld.getTotalProduct();
		int endPage = count/8;
		if (count % 8 != 0) {
			endPage++;
		}
		
		//Delete product
		if (action != null && action.equalsIgnoreCase("delete")) {
			ld.deleteProduct(idP);
		} 
		
		List<Product> list = ld.pagingProduct(index);
		
		request.setAttribute("acc", acc);
		request.setAttribute("listA", list);
		request.setAttribute("endP", endPage);
		request.setAttribute("tag", index);
		request.setAttribute("co", count);
		
		
		request.getRequestDispatcher("URLController?action=manageP").forward(request, response);
	}
}
