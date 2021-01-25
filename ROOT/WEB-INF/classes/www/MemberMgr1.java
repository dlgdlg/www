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
	
	public boolean insertMember(MemberBean bean) {
		boolean flag = false;
		
		Random rand = new Random();
		
		String searchDN = searchFilter + baseDN;
		
		String uid = bean.getId();
		String uidNumber = rand.nextInt(3000)+"";
		String group = bean.getGroup();
		String mail = uid+"@company.com";
		String homeDirectory = "/home/users/"+uid;
		String loginShell = "/bin/bash";
		String userPassword = bean.getPass();
		
		
		DirContext ctx = null;
		
		Hashtable env = new Hashtable();
		env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		
		env.put(Context.PROVIDER_URL, ldapURL);
		
		env.put(Context.SECURITY_AUTHENTICATION, "simple");
		env.put(Context.SECURITY_PRINCIPAL, "cn=admin,"+baseDN);
		env.put(Context.SECURITY_CREDENTIALS, "12345678");
		
		try {
			ctx = new InitialDirContext(env);
			
			Attribute objectClass = new BasicAttribute("objectClass");
			
			objectClass.add("inetOrgPerson");
			objectClass.add("posixAccount");
			objectClass.add("top");
			
			BasicAttributes attrs = new BasicAttributes(true);
			
			attrs.put(objectClass);
			
			attrs.put("cn", uid);
			attrs.put("sn", uid);
			attrs.put("uid", uid);
			attrs.put("uidNumber",uidNumber);
			if(group.equals("users")) {
				attrs.put("gidNumber","501");
			}
			attrs.put("mail", mail);
			attrs.put("homeDirectory", homeDirectory);
			attrs.put("loginShell", loginShell);
			attrs.put("userPassword", userPassword);
			
			InitialDirContext iniDirContext = (InitialDirContext) ctx;
			ctx.bind("cn=" + uid + "," + searchDN, iniDirContext, attrs);
			flag = true;
			System.out.println("회원가입 성공");
			ctx.close();			
		} catch(AuthenticationException authEx) {
			System.out.println(authEx.getMessage());
		} catch(NamingException nameEx) {
			System.out.println(nameEx.getMessage());
		}
		
		return flag;
	}
	
	
	public boolean checkId(String inputId) {
		boolean flag = true;
		
		String searchDN = searchFilter + baseDN; // ou=users,dc=company,dc=com
		
		DirContext ctx = null;
		
		Hashtable env = new Hashtable();
		env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
		
		env.put(Context.PROVIDER_URL, ldapURL);
		
		env.put(Context.SECURITY_AUTHENTICATION, "simple");
		env.put(Context.SECURITY_PRINCIPAL, "cn=web_admin,"+searchDN);
		env.put(Context.SECURITY_CREDENTIALS, "12345678");
		
		try {
			ctx =new InitialDirContext(env);
			
			SearchControls cons = new SearchControls();
			cons.setSearchScope(SearchControls.SUBTREE_SCOPE);
			
			String filter="(&(objectClass=inetOrgPerson)(cn=*))";
			
			NamingEnumeration result = ctx.search(baseDN, filter, cons);
			
			while(result.hasMore()) {
				SearchResult nextEntry = null;
				nextEntry = (SearchResult)result.next();
				
				Attributes attrs = nextEntry.getAttributes();
				if(attrs != null) {
					Attribute cn = attrs.get("cn");
					System.out.println(cn.toString());

					if(cn.toString().substring(5).equals(inputId)) {
						flag = true;
						return flag;// 한번이라도 inputId와 동일한 cn이 존재할 시 false 반환
					} else {
						flag = false;
					}
				}
			}
		} catch(Exception e) {
			System.out.println(e);
		} 
		
		return flag;
	}
}
