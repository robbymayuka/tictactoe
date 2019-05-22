package com.tictactoe.jsp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tictactoe.jsp.TTTConsoleNonOO2P;

/**
 * Servlet implementation class GameServlet
 */
@WebServlet("/GameServlet")
public class GameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String rw = request.getParameter("row");
		String cl = request.getParameter("col");
		String ts = request.getParameter("tableSize");
		String cp = request.getParameter("currentPlayer");
		
		
		int row, col, currentPlayer, status, tableSize = 0;
		
		row = Integer.parseInt(rw);
		col = Integer.parseInt(cl);
		currentPlayer = Integer.parseInt(cp);
		tableSize = Integer.parseInt(ts);
		System.out.print("\nTable size : " + tableSize);
		TTTConsoleNonOO2P game = new TTTConsoleNonOO2P();
		
		game.createArray(tableSize);
		game.movePlayer(currentPlayer, row, col, tableSize);
		status = game.gameStatus(currentPlayer, row-1, col-1, tableSize);
		
		request.setAttribute("currentPlayer", (currentPlayer == TTTConsoleNonOO2P.CROSS) ? TTTConsoleNonOO2P.NOUGHT : TTTConsoleNonOO2P.CROSS);
		request.setAttribute("status", status);
		request.getRequestDispatcher("/main.jsp").forward(request, response);
		
	}

}
