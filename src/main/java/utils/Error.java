package utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Error {

	public static void send404(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setStatus(404);
		req.getRequestDispatcher("/views/errors/404.jsp").forward(req, res);
	}
}