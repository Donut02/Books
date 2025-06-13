package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import model.Tbooks;
import model.CartItem;
import dispatchers.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * FrontController class to handle HTTP requests and responses.
 */
public class FrontController extends HttpServlet {

    private final Map<String, Dispatcher> actions = new HashMap<String, Dispatcher>();
        
    /**
     * Initialize global variables.
     * @param config ServletConfig object
     * @throws ServletException if an error occurs during initialization
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        actions.put(null, new TitleDispatcher());
        actions.put("add_to_cart", new CartDispatcher());
        actions.put("checkout", new CheckoutDispatcher());
        actions.put("continue", new ContinueDispatcher());
        actions.put("update", new UpdateDispatcher());
        actions.put("view_cart", new ViewCartDispatcher());
    }

    /**
     * Process the HTTP GET request.
     * @param request HttpServletRequest object
     * @param response HttpServletResponse object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.err.println("doGet()");
        // Forward GET requests to doPost method
        doPost(request, response);
    }

    /**
     * Process the HTTP POST request.
     * @param request HttpServletRequest object
     * @param response HttpServletResponse object
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");    
    String requestedAction = request.getParameter("action");
    Dispatcher dispatcher = actions.get(requestedAction);
    String nextPage;

    if (dispatcher != null) {
//        request.setAttribute("em", em); // pass EntityManager
        nextPage = dispatcher.execute(request, response);
    } else {
        request.setAttribute("result", "Unknown action: " + requestedAction);
        nextPage = "/jsp/error.jsp";
    }

    dispatch(request, response, nextPage);
}

    

    /**
     * Forward the request to the specified page.
     * @param request HttpServletRequest object
     * @param response HttpServletResponse object
     * @param page Page to forward to
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private void dispatch(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }
    
     

    /**
     * Get Servlet information.
     * @return Servlet information
     */
    public String getServletInfo() {
        return "controller.FrontController Information";
    }
}

