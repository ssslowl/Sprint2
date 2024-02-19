package servlets;


import db.DbManager;
import models.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(value = "/Home")
public class HomeServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Item> items = DbManager.getItems();

        req.setAttribute("items", items);

        req.getRequestDispatcher("Home.jsp").forward(req, resp);


    }
}
