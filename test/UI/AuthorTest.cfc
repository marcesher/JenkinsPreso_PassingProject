component extends="BaseUITestCase" {

	function new_author_should_save(){
		var name = "Selenium Test #getTickCount()#";
        selenium.click("link=Authors");
        waitFor();
        selenium.click("link=New");
        waitFor();
        selenium.type("FIRSTNAME", name);
        selenium.type("LASTNAME", name);
        selenium.type("ISSPOTLIGHT", "N");
        selenium.click("save");
        waitFor();
        assertTrue(selenium.isTextPresent("Records updated"));
        assertEquals(name, selenium.getValue("FIRSTNAME"));
        assertEquals(name, selenium.getValue("LASTNAME"));
        assertEquals("N", selenium.getValue("ISSPOTLIGHT"));

        //now edit
        selenium.type("FIRSTNAME", name & "_edit");
        selenium.type("LASTNAME", name & "_edit");
        selenium.type("ISSPOTLIGHT", "Y");
        selenium.click("save");
        waitFor();
        assertTrue(selenium.isTextPresent("Records updated"));
        assertEquals(name & "_edit", selenium.getValue("FIRSTNAME"));
        assertEquals(name & "_edit", selenium.getValue("LASTNAME"));
        assertEquals("Y", selenium.getValue("ISSPOTLIGHT"));
	}

}