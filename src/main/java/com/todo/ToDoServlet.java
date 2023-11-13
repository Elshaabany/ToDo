package com.todo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/")
public class ToDoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private List<String> toDoList = new ArrayList<>();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("toDoList", toDoList);
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("add")) {
            String newTask = request.getParameter("newTask");
            if (newTask != null && !newTask.isEmpty()) {
                toDoList.add(newTask);
            }
        } else if (action.equals("edit")) {
            int index = Integer.parseInt(request.getParameter("editIndex"));
            String updatedTask = request.getParameter("updatedTask");
            if (index >= 0 && index < toDoList.size() && updatedTask != null && !updatedTask.isEmpty()) {
                toDoList.set(index, updatedTask);
            }
        } else if (action.equals("delete")) {
            int index = Integer.parseInt(request.getParameter("deleteIndex"));
            if (index >= 0 && index < toDoList.size()) {
                toDoList.remove(index);
            }
        }

        response.sendRedirect(request.getContextPath() + "/");
    }
}
