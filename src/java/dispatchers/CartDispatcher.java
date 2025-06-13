/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dispatchers;

import model.Tbooks;
import model.CartItem;

import javax.servlet.http.*;
import java.util.*;

public class CartDispatcher implements Dispatcher {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        Map<String, CartItem> cart = (Map<String, CartItem>) session.getAttribute("cart");
        String[] selectedBooks = request.getParameterValues("add");

        if (selectedBooks == null || selectedBooks.length == 0) {
            return "/jsp/titles.jsp";
        }

        if (cart == null) {
            cart = new HashMap<String, CartItem>();
        }

        for (String isbn : selectedBooks) {
            int quantity = Integer.parseInt(request.getParameter(isbn));
            if (cart.containsKey(isbn)) {
                CartItem item = cart.get(isbn);
                item.setQuantity(quantity);
            } else {
                Tbooks book = getBookFromList(isbn, session);
                CartItem item = new CartItem(book);
                item.setQuantity(quantity);
                cart.put(isbn, item);
            }
        }

        session.setAttribute("cart", cart);
        return "/jsp/titles.jsp";
    }

    private Tbooks getBookFromList(String isbn, HttpSession session) {
        List<Tbooks> list = (List<Tbooks>) session.getAttribute("books");
        for (Tbooks book : list) {
            if (isbn.equals(book.getIsbn())) {
                return book;
            }
        }
        return null;
    }
}


