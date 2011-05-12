component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var authors = EntityNew("authors");
			authors.setAUTHORID("2");
			authors.setFIRSTNAME("Test String");
			authors.setLASTNAME("Test String");
			authors.setBIO("Test String");
			authors.setISSPOTLIGHT("T");
			EntitySave(authors);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM AUTHORS WHERE AUTHORID = 1");
		fromQuery = qry.execute().getResult();

		var authors = EntityLoad("authors", 1, true);

		// Primary Key Test
		// Need to test if AUTHORID is null that we don't try and test an empty string versus null
		if (not IsNull(authors.getAUTHORID())){
			assertEquals(numberFormat(fromQuery["AUTHORID"][1], "_"), numberFormat(authors.getAUTHORID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["AUTHORID"][1]) eq 0);
		}

		// Need to test if FIRSTNAME is null that we don't try and test an empty string versus null
		if (not IsNull(authors.getFIRSTNAME())){
			assertEquals(fromQuery["FIRSTNAME"][1], authors.getFIRSTNAME());
		}
		else{
			assertTrue(Len(fromQuery["FIRSTNAME"][1]) eq 0);
		}

		// Need to test if LASTNAME is null that we don't try and test an empty string versus null
		if (not IsNull(authors.getLASTNAME())){
			assertEquals(fromQuery["LASTNAME"][1], authors.getLASTNAME());
		}
		else{
			assertTrue(Len(fromQuery["LASTNAME"][1]) eq 0);
		}

		// Need to test if BIO is null that we don't try and test an empty string versus null
		if (not IsNull(authors.getBIO())){
			assertEquals(fromQuery["BIO"][1], authors.getBIO());
		}
		else{
			assertTrue(Len(fromQuery["BIO"][1]) eq 0);
		}

		// Need to test if ISSPOTLIGHT is null that we don't try and test an empty string versus null
		if (not IsNull(authors.getISSPOTLIGHT())){
			assertEquals(fromQuery["ISSPOTLIGHT"][1], authors.getISSPOTLIGHT());
		}
		else{
			assertTrue(Len(fromQuery["ISSPOTLIGHT"][1]) eq 0);
			//blahblah
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var authors = EntityLoad("authors", '1', true);
			authors.setFIRSTNAME("Test String");
			authors.setLASTNAME("Test String");
			authors.setBIO("Test String");
			authors.setISSPOTLIGHT("T");
			EntitySave(authors);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var authors = EntityNew("authors");
			authors.setAUTHORID("2");
			authors.setFIRSTNAME("Test String");
			authors.setLASTNAME("Test String");
			authors.setBIO("Test String");
			authors.setISSPOTLIGHT("T");
			EntitySave(authors);

			// Now see if we can delete it.
			var authorsCopy = EntityLoad("authors", authors.getAUTHORID(), true);
			EntityDelete(authorsCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}