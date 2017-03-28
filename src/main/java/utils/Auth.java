package utils;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.SignatureException;

public class Auth {

    public static String createToken(HttpServletRequest req) {
        return Jwts.builder()
            .setIssuer(req.getServerName())
            .setSubject("clement.vanhecke@gmail.com")
            .setExpiration(new Date(1491640000000l))
            .claim("scope", "student")
            .signWith(SignatureAlgorithm.HS256, Conf.getProperty("jwt_key"))
            .compact();
    }

    public static Jws<Claims> getTokenClaims(String token) {

        Jws<Claims> jwt = null;

        try {
            jwt = Jwts.parser().setSigningKey(Conf.getProperty("jwt_key")).parseClaimsJws(token);
        } catch (SignatureException e) {}

        return jwt;

    }

    public static boolean validate(String access_token) {

        try {
            Jwts.parser().setSigningKey(Conf.getProperty("jwt_key")).parseClaimsJws(access_token);
            return true;
        } catch (SignatureException e) {
            return false;
        }
    }
}