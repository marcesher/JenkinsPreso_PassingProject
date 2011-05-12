component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var sponsors = EntityNew("sponsors");
			sponsors.setSPONSORID("2");
			sponsors.setSPONSORNAME("Test String");
			sponsors.setWEBADDRESS("Test String");
			sponsors.setDESCRIPTION("Test String");
			sponsors.setSPONSORAD("Test String");
			sponsors.setISSPOTLIGHT("T");
			sponsors.setCITY("Test String");
			sponsors.setSTATE("Test String");
			sponsors.setADDRESS("Test String");
			sponsors.setPOSTALCODE("Test String");
			sponsors.setPHONE("Test String");
			sponsors.setMAP("Test String");
			EntitySave(sponsors);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM SPONSORS WHERE SPONSORID = 1");
		fromQuery = qry.execute().getResult();

		var sponsors = EntityLoad("sponsors", 1, true);

		// Primary Key Test
		// Need to test if SPONSORID is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getSPONSORID())){
			assertEquals(numberFormat(fromQuery["SPONSORID"][1], "_"), numberFormat(sponsors.getSPONSORID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["SPONSORID"][1]) eq 0);
		}

		// Need to test if SPONSORNAME is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getSPONSORNAME())){
			assertEquals(fromQuery["SPONSORNAME"][1], sponsors.getSPONSORNAME());
		}
		else{
			assertTrue(Len(fromQuery["SPONSORNAME"][1]) eq 0);
		}

		// Need to test if WEBADDRESS is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getWEBADDRESS())){
			assertEquals(fromQuery["WEBADDRESS"][1], sponsors.getWEBADDRESS());
		}
		else{
			assertTrue(Len(fromQuery["WEBADDRESS"][1]) eq 0);
		}

		// Need to test if DESCRIPTION is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getDESCRIPTION())){
			assertEquals(fromQuery["DESCRIPTION"][1], sponsors.getDESCRIPTION());
		}
		else{
			assertTrue(Len(fromQuery["DESCRIPTION"][1]) eq 0);
		}

		// Need to test if SPONSORAD is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getSPONSORAD())){
			assertEquals(fromQuery["SPONSORAD"][1], sponsors.getSPONSORAD());
		}
		else{
			assertTrue(Len(fromQuery["SPONSORAD"][1]) eq 0);
		}

		// Need to test if ISSPOTLIGHT is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getISSPOTLIGHT())){
			assertEquals(fromQuery["ISSPOTLIGHT"][1], sponsors.getISSPOTLIGHT());
		}
		else{
			assertTrue(Len(fromQuery["ISSPOTLIGHT"][1]) eq 0);
		}

		// Need to test if CITY is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getCITY())){
			assertEquals(fromQuery["CITY"][1], sponsors.getCITY());
		}
		else{
			assertTrue(Len(fromQuery["CITY"][1]) eq 0);
		}

		// Need to test if STATE is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getSTATE())){
			assertEquals(fromQuery["STATE"][1], sponsors.getSTATE());
		}
		else{
			assertTrue(Len(fromQuery["STATE"][1]) eq 0);
		}

		// Need to test if ADDRESS is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getADDRESS())){
			assertEquals(fromQuery["ADDRESS"][1], sponsors.getADDRESS());
		}
		else{
			assertTrue(Len(fromQuery["ADDRESS"][1]) eq 0);
		}

		// Need to test if POSTALCODE is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getPOSTALCODE())){
			assertEquals(fromQuery["POSTALCODE"][1], sponsors.getPOSTALCODE());
		}
		else{
			assertTrue(Len(fromQuery["POSTALCODE"][1]) eq 0);
		}

		// Need to test if PHONE is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getPHONE())){
			assertEquals(fromQuery["PHONE"][1], sponsors.getPHONE());
		}
		else{
			assertTrue(Len(fromQuery["PHONE"][1]) eq 0);
		}

		// Need to test if MAP is null that we don't try and test an empty string versus null
		if (not IsNull(sponsors.getMAP())){
			assertEquals(fromQuery["MAP"][1], sponsors.getMAP());
		}
		else{
			assertTrue(Len(fromQuery["MAP"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var sponsors = EntityLoad("sponsors", '1', true);
			sponsors.setSPONSORNAME("Test String");
			sponsors.setWEBADDRESS("Test String");
			sponsors.setDESCRIPTION("Test String");
			sponsors.setSPONSORAD("Test String");
			sponsors.setISSPOTLIGHT("T");
			sponsors.setCITY("Test String");
			sponsors.setSTATE("Test String");
			sponsors.setADDRESS("Test String");
			sponsors.setPOSTALCODE("Test String");
			sponsors.setPHONE("Test String");
			sponsors.setMAP("Test String");
			EntitySave(sponsors);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var sponsors = EntityNew("sponsors");
			sponsors.setSPONSORID("2");
			sponsors.setSPONSORNAME("Test String");
			sponsors.setWEBADDRESS("Test String");
			sponsors.setDESCRIPTION("Test String");
			sponsors.setSPONSORAD("Test String");
			sponsors.setISSPOTLIGHT("T");
			sponsors.setCITY("Test String");
			sponsors.setSTATE("Test String");
			sponsors.setADDRESS("Test String");
			sponsors.setPOSTALCODE("Test String");
			sponsors.setPHONE("Test String");
			sponsors.setMAP("Test String");
			EntitySave(sponsors);

			// Now see if we can delete it.
			var sponsorsCopy = EntityLoad("sponsors", sponsors.getSPONSORID(), true);
			EntityDelete(sponsorsCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}