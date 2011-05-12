component extends="BaseUITestCase" {


	public void function homePage_should_load_and_contain_links() {

        expectedLinks = listToArray(expectedLinks);
        for( var link in expectedLinks ){
	        assertTrue(selenium.isElementPresent("link=#link#"));
        }
    }

}