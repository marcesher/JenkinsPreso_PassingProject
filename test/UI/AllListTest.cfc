component extends="BaseUITestCase" {

    /**
	* @mxunit:dataprovider expectedLinks
	*/
	function homePage_links_should_load_and_contain_expected_elements(link){
		goHome();
		selenium.click("link=#link#");
        waitFor();
        debug("looking at link #link# ");
        assertEquals("#link#", selenium.getText("//h2"));
        assertTrue(selenium.isElementPresent("link=Main"));
        assertTrue(selenium.isElementPresent("link=List"));
        assertTrue(selenium.isElementPresent("link=New"));

		//silly XPath like this is why you want to use IDs instead!
        if( selenium.isElementPresent("//tbody/tr[2]/td[1]") ){
	        assertTrue(selenium.isElementPresent("link=Read"));
	        assertTrue(selenium.isElementPresent("link=Edit"));
	        assertTrue(selenium.isElementPresent("link=Delete"));
        }
	}

}