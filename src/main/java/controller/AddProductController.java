package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListProductDAO;

/**
 * Servlet implementation class AddProductController
 */
@WebServlet("/add")
public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductController() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8"); // Vietnamese

		// Get parameter add new product
		String name = request.getParameter("name");
		String desc = request.getParameter("description");
		String price = request.getParameter("price");
		String image = request.getParameter("image");
		String type = request.getParameter("type");
		String brand = request.getParameter("brand");

		// Get total product
		ListProductDAO ld = new ListProductDAO();

		// Delete and Add product
		float prices = Float.parseFloat(price);
		ld.insertProduct(name, desc, prices, image, type, brand);

		response.sendRedirect("ManagerProduct");

	}

}
