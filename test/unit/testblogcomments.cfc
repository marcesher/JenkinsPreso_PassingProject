component extends="mxunit.framework.TestCase" {

	void function letsPass1(){
		assertTrue(true);
	}
	void function letsPass2(){
		assertTrue(true);
	}
	
	
	
	
	
	
	void function letsPass3(){
		assertTrue(true);
	}
	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var blogcomments = EntityNew("blogcomments");
			blogcomments.setID("Test String");
			blogcomments.setENTRYIDFK("Test String");
			blogcomments.setNAME("Test String");
			blogcomments.setEMAIL("Test String");
			blogcomments.setCOMMENT("Test String");
			blogcomments.setPOSTED("{ts '2000-01-01 00:00:00'}");
			EntitySave(blogcomments);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var blogcomments = EntityNew("blogcomments");
			blogcomments.setID("Test String");
			blogcomments.setENTRYIDFK("Test String");
			blogcomments.setNAME("Test String");
			blogcomments.setEMAIL("Test String");
			blogcomments.setCOMMENT("Test String");
			blogcomments.setPOSTED("{ts '2000-01-01 00:00:00'}");
			EntitySave(blogcomments);

			// Now see if we can delete it.
			var blogcommentsCopy = EntityLoad("blogcomments", blogcomments.getID(), true);
			EntityDelete(blogcommentsCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}