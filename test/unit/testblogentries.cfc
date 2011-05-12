component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var blogentries = EntityNew("blogentries");
			blogentries.setID("Test String");
			blogentries.setTITLE("Test String");
			blogentries.setBODY("Test String");
			blogentries.setPOSTED("{ts '2000-01-01 00:00:00'}");
			blogentries.setMOREBODY("Test String");
			blogentries.setBLOG("Test String");
			blogentries.setALIAS("Test String");
			blogentries.setUSERNAME("Test String");
			EntitySave(blogentries);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM BLOGENTRIES WHERE ID = '4FF7805E-AF3A-9CD7-96B160391DBB3AF3'");
		fromQuery = qry.execute().getResult();

		var blogentries = EntityLoad("blogentries", '4FF7805E-AF3A-9CD7-96B160391DBB3AF3', true);

		// Primary Key Test
		// Need to test if ID is null that we don't try and test an empty string versus null
		if (not IsNull(blogentries.getID())){
			assertEquals(fromQuery["ID"][1], blogentries.getID());
		}
		else{
			assertTrue(Len(fromQuery["ID"][1]) eq 0);
		}

		// Need to test if TITLE is null that we don't try and test an empty string versus null
		if (not IsNull(blogentries.getTITLE())){
			assertEquals(fromQuery["TITLE"][1], blogentries.getTITLE());
		}
		else{
			assertTrue(Len(fromQuery["TITLE"][1]) eq 0);
		}

		// Need to test if BODY is null that we don't try and test an empty string versus null
		if (not IsNull(blogentries.getBODY())){
			assertEquals(fromQuery["BODY"][1], blogentries.getBODY());
		}
		else{
			assertTrue(Len(fromQuery["BODY"][1]) eq 0);
		}

		// Need to test if POSTED is null that we don't try and test an empty string versus null
		if (not IsNull(blogentries.getPOSTED())){
			var formatedExpected = DateFormat(fromQuery["POSTED"][1], "yyyy-dd-mm") & " " & TimeFormat(fromQuery["POSTED"][1], "hh:mm:ss.l");
			var formatedActual = DateFormat(blogentries.getPOSTED(), "yyyy-dd-mm") & " " & TimeFormat(blogentries.getPOSTED(), "hh:mm:ss.l");
			assertEquals(formatedExpected, formatedActual);
		}
		else{
			assertTrue(Len(fromQuery["POSTED"][1]) eq 0);
		}

		// Need to test if MOREBODY is null that we don't try and test an empty string versus null
		if (not IsNull(blogentries.getMOREBODY())){
			assertEquals(fromQuery["MOREBODY"][1], blogentries.getMOREBODY());
		}
		else{
			assertTrue(Len(fromQuery["MOREBODY"][1]) eq 0);
		}

		// Need to test if BLOG is null that we don't try and test an empty string versus null
		if (not IsNull(blogentries.getBLOG())){
			assertEquals(fromQuery["BLOG"][1], blogentries.getBLOG());
		}
		else{
			assertTrue(Len(fromQuery["BLOG"][1]) eq 0);
		}

		// Need to test if ALIAS is null that we don't try and test an empty string versus null
		if (not IsNull(blogentries.getALIAS())){
			assertEquals(fromQuery["ALIAS"][1], blogentries.getALIAS());
		}
		else{
			assertTrue(Len(fromQuery["ALIAS"][1]) eq 0);
		}

		// Need to test if USERNAME is null that we don't try and test an empty string versus null
		if (not IsNull(blogentries.getUSERNAME())){
			assertEquals(fromQuery["USERNAME"][1], blogentries.getUSERNAME());
		}
		else{
			assertTrue(Len(fromQuery["USERNAME"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var blogentries = EntityLoad("blogentries", '4FF7805E-AF3A-9CD7-96B160391DBB3AF3', true);
			blogentries.setTITLE("Test String");
			blogentries.setBODY("Test String");
			blogentries.setPOSTED("{ts '2000-01-01 00:00:00'}");
			blogentries.setMOREBODY("Test String");
			blogentries.setBLOG("Test String");
			blogentries.setALIAS("Test String");
			blogentries.setUSERNAME("Test String");
			EntitySave(blogentries);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var blogentries = EntityNew("blogentries");
			blogentries.setID("Test String");
			blogentries.setTITLE("Test String");
			blogentries.setBODY("Test String");
			blogentries.setPOSTED("{ts '2000-01-01 00:00:00'}");
			blogentries.setMOREBODY("Test String");
			blogentries.setBLOG("Test String");
			blogentries.setALIAS("Test String");
			blogentries.setUSERNAME("Test String");
			EntitySave(blogentries);

			// Now see if we can delete it.
			var blogentriesCopy = EntityLoad("blogentries", blogentries.getID(), true);
			EntityDelete(blogentriesCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}