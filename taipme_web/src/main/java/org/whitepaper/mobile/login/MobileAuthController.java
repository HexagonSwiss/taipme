package org.whitepaper.mobile.login;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.whitepaper.web.common.AbstractController;

/**
 * Spring MVC controller for 'AnaUtente' management.
 */
@Controller
@RequestMapping("/password")
public class MobileAuthController extends AbstractController {

	//--- Variables names ( to be used in JSP with Expression Language )
	private static final String MAIN_ENTITY_NAME = "anaUtente";
			

	//--------------------------------------------------------------------------------------
	/**
	 * Default constructor
	 */
	public MobileAuthController() {
		super(MobileAuthController.class, MAIN_ENTITY_NAME );
		log("PasswordController created.");
	}

	//--------------------------------------------------------------------------------------
	// Spring MVC model management
	//--------------------------------------------------------------------------------------





	@RequestMapping(value = "/login_mobile", method = RequestMethod.GET)
    public String loginMobile(@RequestParam(required = false) String username, 
                              @RequestParam(required = false) String password) {
    	System.out.println("Il filtro ha chiamato loginMobile con username: " + username);
        return "Hello, IS LOGIN! Username: " + username;
    }
	
	
}
