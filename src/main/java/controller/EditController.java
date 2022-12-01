package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListProductDAO;
import model.Product;

/**
 * Servlet implementation class EditController
 */
@WebServlet("/EditController")
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8"); // Vietnamese
		
		String idP = request.getParameter("idP");
		String action = request.getParameter("action");
		
		//Get parameter add new product
		String name = request.getParameter("name");
		String desc = request.getParameter("description");
		String price = request.getParameter("price");
		String image = request.getParameter("image");
		String type = request.getParameter("type");
		String brand = request.getParameter("brand");
		
		ListProductDAO ld = new ListProductDAO();
		
		//Delete product
		if (action != null && action.equalsIgnoreCase("load")) {
			Product product = ld.getProduct(idP);
			request.setAttribute("pro", product);
			request.getRequestDispatcher("URLController?action=edit").forward(request, response);
		} else if (action != null && action.equalsIgnoreCase("edit")) {
			float prices = Float.parseFloat(price);
			ld.editProduct(idP, name, desc, prices, image, type, brand);
			response.sendRedirect("ManagerProduct");
		} 
		
		
		
		
	}
}
