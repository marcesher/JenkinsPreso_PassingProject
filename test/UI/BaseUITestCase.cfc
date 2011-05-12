component extends="cfselenium.CFSeleniumTestCase"{

	browserURL = "http://localhost";
	expectedLinks = "Authors,Blogcategories,Blogcomments,Blogentries,Books,Calendar,Coupons,Meetings,Memberdownload,Members,Pollresponses,Polls,Sponsors";


	function setUp(){
		super.setUp();
		goHome();
	}

	private function goHome(){
		 selenium.open("/CFO_JenkinsPreso_PassingProject/index.cfm");
	}

	private function waitFor(millis="30000"){
        selenium.waitForPageToLoad(millis);
	}

}