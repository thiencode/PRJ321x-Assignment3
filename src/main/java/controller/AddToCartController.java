package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ListProductDAO;
import model.Cart;
import model.Product;

/**
 * Servlet implementation class AddToCartController
 */
@WebServlet("/AddToCartController")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCartController() {
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

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");

		try {
			HttpSession session = request.getSession(true);
			
			String idd = request.getParameter("id");
			String action = request.getParameter("action");
			int id = Integer.parseInt(idd);
			int countProduct = 0;
			
			if (action != null && action.equalsIgnoreCase("add")) {
				if (session.getAttribute("cart") == null) {
					session.setAttribute("cart", new Cart());
				}
				Product p = new ListProductDAO().getProduct(idd);
				Cart c = (Cart) session.getAttribute("cart");
				c.add(new Product(p.getId(), p.getName(), p.getDescription(), p.getPrice(), p.getSrc(), p.getType(),
						p.getBrand(), 1));
				List<Product> productList = c.getItems();
				countProduct = c.getCount();
				session.setAttribute("productList", productList);
			} else if (action != null && action.equalsIgnoreCase("delete")) {
				
				Cart c = (Cart) session.getAttribute("cart");
				c.remove(id);
				countProduct = c.getCount();
			} else if (action != null && action.equalsIgnoreCase("minus")) {
				Cart c = (Cart) session.getAttribute("cart");
				
				if (c.minus(id) <= 0) {
					c.remove(id);
				} 
				countProduct = c.getCount();					
			}

			session.setAttribute("countP", countProduct);
			response.sendRedirect("cart.jsp");
		} catch (IOException e) {
			response.getWriter().println(e);
		}
	}
}
