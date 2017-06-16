package utils;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;
import database.Student.Student;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class Auth {

	public static String createToken(HttpServletRequest req, String username, String scope) {
		return Jwts.builder()
			.setIssuer(req.getServerName())
			.setSubject(username)
			.claim("scope", scope)
			.claim("username", username)
			.setExpiration(new Date(System.currentTimeMillis() + 60 * 60 * 24 * 365 * 10 * 1000))
			.signWith(SignatureAlgorithm.HS256, Conf.getProperty("jwt_key"))
			.compact();
	}

	public static Claims getTokenClaims(String token) {

		Claims claims = null;

		try {
			Jws<Claims> jwt = Jwts.parser().setSigningKey(Conf.getProperty("jwt_key")).parseClaimsJws(token);
			claims = jwt.getBody();
		} catch (Exception e) {}

		return claims;
	}

	public static String getTokenClaim(String token, String _claim) {

		String claim = null;

		try {
			Jws<Claims> jwt = Jwts.parser().setSigningKey(Conf.getProperty("jwt_key")).parseClaimsJws(token);
			claim = (String) jwt.getBody().get(_claim);
		} catch (Exception e) {}

		return claim;
	}

	public static String validate(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		String access_token = Cookies.getCookieValue(req, "access_token");

		if (access_token == null) {
			req.getRequestDispatcher("/views/home/login.jsp").forward(req, res);
			return null;
		}

		try {

			Jwts.parser().setSigningKey(Conf.getProperty("jwt_key")).parseClaimsJws(access_token);

		} catch (Exception e) {

			req.getRequestDispatcher("/views/home/login.jsp").forward(req, res);

			return null;

		}

		return access_token;
	}

	private static String getAccessToken(String username) {

		Database db = new Database();

		Map<String, String> params = new HashMap<String, String>();

		params.put("username", username);

		Student student = (Student) db.selectOne("Student", params);

		if (student == null)
			return null;

		return student.getAccessToken();
	}

	public static boolean validateUsername(String acces_token, String db_access_token) {
		return getTokenClaim(acces_token, "username") == getTokenClaim(db_access_token, "username");
	}
}