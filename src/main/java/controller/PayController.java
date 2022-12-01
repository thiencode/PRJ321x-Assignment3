
package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import dao.OrdersDAO;
import model.Cart;
import model.Orders;

/**
 * Servlet implementation class PayController
 */
@WebServlet("/PayController")
public class PayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayController() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			HttpSession session = request.getSession(true);
			
			if (session.getAttribute("cart") == null) {	
			}
			OrdersDAO dao = new OrdersDAO();
			Cart c = (Cart) session.getAttribute("cart");
			String username  = request.getParameter("name");
			String discount = request.getParameter("discount");
			String address = request.getParameter("address");
			
			if (username == "" || address == "") {
				session.setAttribute("error", "invalid syntax");
				response.sendRedirect("URLController?action=cart");
				return;
			}
			
			Account acc = dao.checkAccount(username);
			if (acc == null) {
				session.setAttribute("error", "Please create an Account");
				response.sendRedirect("URLController?action=cart");
			} else {
				Orders d = new Orders(username, 2, discount, address, "", null);
				dao.insertOrder(d, c);
				response.sendRedirect("URLController");
			}
			
		} catch (Exception e) {
			response.getWriter().println(e);
			e.printStackTrace();
		}
	}
}
