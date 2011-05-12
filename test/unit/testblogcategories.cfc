component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var blogcategories = EntityNew("blogcategories");
			blogcategories.setCATEGORYID("Test String");
			blogcategories.setCATEGORYNAME("Test String");
			blogcategories.setBLOG("Test String");
			EntitySave(blogcategories);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM BLOGCATEGORIES WHERE CATEGORYID = '4BEA9FD1-B452-AA00-564E9AACF0BA0E60'");
		fromQuery = qry.execute().getResult();

		var blogcategories = EntityLoad("blogcategories", '4BEA9FD1-B452-AA00-564E9AACF0BA0E60', true);

		// Primary Key Test
		// Need to test if CATEGORYID is null that we don't try and test an empty string versus null
		if (not IsNull(blogcategories.getCATEGORYID())){
			assertEquals(fromQuery["CATEGORYID"][1], blogcategories.getCATEGORYID());
		}
		else{
			assertTrue(Len(fromQuery["CATEGORYID"][1]) eq 0);
		}

		// Need to test if CATEGORYNAME is null that we don't try and test an empty string versus null
		if (not IsNull(blogcategories.getCATEGORYNAME())){
			assertEquals(fromQuery["CATEGORYNAME"][1], blogcategories.getCATEGORYNAME());
		}
		else{
			assertTrue(Len(fromQuery["CATEGORYNAME"][1]) eq 0);
		}

		// Need to test if BLOG is null that we don't try and test an empty string versus null
		if (not IsNull(blogcategories.getBLOG())){
			assertEquals(fromQuery["BLOG"][1], blogcategories.getBLOG());
		}
		else{
			assertTrue(Len(fromQuery["BLOG"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var blogcategories = EntityLoad("blogcategories", '4BEA9FD1-B452-AA00-564E9AACF0BA0E60', true);
			blogcategories.setCATEGORYNAME("Test String");
			blogcategories.setBLOG("Test String");
			EntitySave(blogcategories);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var blogcategories = EntityNew("blogcategories");
			blogcategories.setCATEGORYID("Test String");
			blogcategories.setCATEGORYNAME("Test String");
			blogcategories.setBLOG("Test String");
			EntitySave(blogcategories);

			// Now see if we can delete it.
			var blogcategoriesCopy = EntityLoad("blogcategories", blogcategories.getCATEGORYID(), true);
			EntityDelete(blogcategoriesCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}