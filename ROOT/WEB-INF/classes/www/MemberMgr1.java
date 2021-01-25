package www;

import java.util.*;
import javax.naming.directory.*;
import javax.naming.*;
import javax.naming.ldap.*;

public class MemberMgr1 {
	private static String ldapURL = "ldap://ldap.company.com:389";
	private static String baseDN = "dc=company,dc=com";
	private static String searchFilter = "ou=users,";
	
	public MemberMgr1() {System.out.print("생성자 호출 완료");}
	
	public boolean loginMember(String userId, String userPw) {
		boolean isAuthenticated = false;
		
		String searchDN = searchFilter + baseDN;
		System.out.println(searchDN);
		
		DirContext ctx = null;
		
		Hashtable env = new Hashtable();
		env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		
		env.put(Context.PROVIDER_URL, ldapURL);
		
		env.put(Context.SECURITY_AUTHENTICATION, "simple");
		env.put(Context.SECURITY_PRINCIPAL, "cn="+userId+","+searchDN);
		env.put(Context.SECURITY_CREDENTIALS, userPw);
		
		try {
			ctx = new InitialDirContext(env);
			isAuthenticated = true;
		} catch (NamingException e) {
			System.out.println(e);
		} finally {
			try {
				if(ctx != null ) {
					ctx.close();
				}
			} catch(Exception e2) {
				System.out.println("Here!");
			}
		}
		return isAuthenticated;
	}
}
