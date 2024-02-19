package servlets;

import db.DbManager;
import models.Item;
import models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(value = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        req.getRequestDispatcher("login.jsp").forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = DbManager.getUser(req.getParameter("username"));

        req.setAttribute("result", "incorrect username");

        if(user != null){
            req.setAttribute("result", "incorrect password");

            if (user.getPassword().equals(req.getParameter("password"))){
                req.setAttribute("result", "success");
                req.getSession().setAttribute("user", user);
                resp.sendRedirect("Home");
                return;

            }
        }

        req.getRequestDispatcher("login.jsp").forward(req, resp);



    }
}
