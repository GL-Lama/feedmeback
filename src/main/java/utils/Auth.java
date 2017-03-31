package utils;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;
import database.Student;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class Auth {

    public static String createToken(HttpServletRequest req) {
        return Jwts.builder()
            .setIssuer(req.getServerName())
            .setSubject("clement.vanhecke@gmail.com")
            .claim("scope", "student")
            .claim("username", "cvanhecke")
            .setExpiration(new Date(System.currentTimeMillis() + 60 * 60 * 24 * 365 * 10 * 1000))
            .signWith(SignatureAlgorithm.HS256, Conf.getProperty("jwt_key"))
            .compact();
    }

    public static String getTokenClaim(String token, String _claim) {

        String claim = null;

        try {
            Jws<Claims> jwt = Jwts.parser().setSigningKey(Conf.getProperty("jwt_key")).parseClaimsJws(token);
            claim = (String) jwt.getBody().get(_claim);
        } catch (Exception e) {}

        return claim;
    }

    public static boolean validate(String access_token, HttpServletRequest req, HttpServletResponse res) {

        try {
            Jwts.parser().setSigningKey(Conf.getProperty("jwt_key")).parseClaimsJws(access_token);
        } catch (Exception e) {

            String db_access_token = getAccessToken(getTokenClaim(access_token, "username"));

            if (access_token != db_access_token) {
                if (!validateUsername(access_token, db_access_token))
                    return false;

                else {
                    res.addCookie(new Cookie("access_token", createToken(req)));
                    return true;
                }
            }
        }

        return true;
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