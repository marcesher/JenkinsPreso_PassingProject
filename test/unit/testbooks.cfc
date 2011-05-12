component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var books = EntityNew("books");
			books.setBOOKID("2");
			books.setAUTHORID("2");
			books.setTITLE("Test String");
			books.setBOOKDESCRIPTION("Test String");
			books.setBOOKIMAGE("Test String");
			books.setTHUMBNAILIMAGE("Test String");
			books.setISSPOTLIGHT("T");
			books.setGENRE("Test String");
			EntitySave(books);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM BOOKS WHERE BOOKID = 1");
		fromQuery = qry.execute().getResult();

		var books = EntityLoad("books", 1, true);

		// Primary Key Test
		// Need to test if BOOKID is null that we don't try and test an empty string versus null
		if (not IsNull(books.getBOOKID())){
			assertEquals(numberFormat(fromQuery["BOOKID"][1], "_"), numberFormat(books.getBOOKID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["BOOKID"][1]) eq 0);
		}

		// Need to test if AUTHORID is null that we don't try and test an empty string versus null
		if (not IsNull(books.getAUTHORID())){
			assertEquals(numberFormat(fromQuery["AUTHORID"][1], "_"), numberFormat(books.getAUTHORID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["AUTHORID"][1]) eq 0);
		}

		// Need to test if TITLE is null that we don't try and test an empty string versus null
		if (not IsNull(books.getTITLE())){
			assertEquals(fromQuery["TITLE"][1], books.getTITLE());
		}
		else{
			assertTrue(Len(fromQuery["TITLE"][1]) eq 0);
		}

		// Need to test if BOOKDESCRIPTION is null that we don't try and test an empty string versus null
		if (not IsNull(books.getBOOKDESCRIPTION())){
			assertEquals(fromQuery["BOOKDESCRIPTION"][1], books.getBOOKDESCRIPTION());
		}
		else{
			assertTrue(Len(fromQuery["BOOKDESCRIPTION"][1]) eq 0);
		}

		// Need to test if BOOKIMAGE is null that we don't try and test an empty string versus null
		if (not IsNull(books.getBOOKIMAGE())){
			assertEquals(fromQuery["BOOKIMAGE"][1], books.getBOOKIMAGE());
		}
		else{
			assertTrue(Len(fromQuery["BOOKIMAGE"][1]) eq 0);
		}

		// Need to test if THUMBNAILIMAGE is null that we don't try and test an empty string versus null
		if (not IsNull(books.getTHUMBNAILIMAGE())){
			assertEquals(fromQuery["THUMBNAILIMAGE"][1], books.getTHUMBNAILIMAGE());
		}
		else{
			assertTrue(Len(fromQuery["THUMBNAILIMAGE"][1]) eq 0);
		}

		// Need to test if ISSPOTLIGHT is null that we don't try and test an empty string versus null
		if (not IsNull(books.getISSPOTLIGHT())){
			assertEquals(fromQuery["ISSPOTLIGHT"][1], books.getISSPOTLIGHT());
		}
		else{
			assertTrue(Len(fromQuery["ISSPOTLIGHT"][1]) eq 0);
		}

		// Need to test if GENRE is null that we don't try and test an empty string versus null
		if (not IsNull(books.getGENRE())){
			assertEquals(fromQuery["GENRE"][1], books.getGENRE());
		}
		else{
			assertTrue(Len(fromQuery["GENRE"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var books = EntityLoad("books", '1', true);
			books.setAUTHORID("2");
			books.setTITLE("Test String");
			books.setBOOKDESCRIPTION("Test String");
			books.setBOOKIMAGE("Test String");
			books.setTHUMBNAILIMAGE("Test String");
			books.setISSPOTLIGHT("T");
			books.setGENRE("Test String");
			EntitySave(books);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var books = EntityNew("books");
			books.setBOOKID("2");
			books.setAUTHORID("2");
			books.setTITLE("Test String");
			books.setBOOKDESCRIPTION("Test String");
			books.setBOOKIMAGE("Test String");
			books.setTHUMBNAILIMAGE("Test String");
			books.setISSPOTLIGHT("T");
			books.setGENRE("Test String");
			EntitySave(books);

			// Now see if we can delete it.
			var booksCopy = EntityLoad("books", books.getBOOKID(), true);
			EntityDelete(booksCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}