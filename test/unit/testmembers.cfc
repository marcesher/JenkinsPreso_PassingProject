component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var members = EntityNew("members");
			members.setMEMBERID("2");
			members.setFIRSTNAME("Test String");
			members.setLASTNAME("Test String");
			members.setEMAIL("Test String");
			members.setMEMBERPASSWORD("Test Str");
			members.setISADMIN("T");
			members.setISACTIVE("T");
			members.setISBLOGSPOTLIGHT("T");
			EntitySave(members);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM MEMBERS WHERE MEMBERID = 1");
		fromQuery = qry.execute().getResult();

		var members = EntityLoad("members", 1, true);

		// Primary Key Test
		// Need to test if MEMBERID is null that we don't try and test an empty string versus null
		if (not IsNull(members.getMEMBERID())){
			assertEquals(numberFormat(fromQuery["MEMBERID"][1], "_"), numberFormat(members.getMEMBERID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["MEMBERID"][1]) eq 0);
		}

		// Need to test if FIRSTNAME is null that we don't try and test an empty string versus null
		if (not IsNull(members.getFIRSTNAME())){
			assertEquals(fromQuery["FIRSTNAME"][1], members.getFIRSTNAME());
		}
		else{
			assertTrue(Len(fromQuery["FIRSTNAME"][1]) eq 0);
		}

		// Need to test if LASTNAME is null that we don't try and test an empty string versus null
		if (not IsNull(members.getLASTNAME())){
			assertEquals(fromQuery["LASTNAME"][1], members.getLASTNAME());
		}
		else{
			assertTrue(Len(fromQuery["LASTNAME"][1]) eq 0);
		}

		// Need to test if EMAIL is null that we don't try and test an empty string versus null
		if (not IsNull(members.getEMAIL())){
			assertEquals(fromQuery["EMAIL"][1], members.getEMAIL());
		}
		else{
			assertTrue(Len(fromQuery["EMAIL"][1]) eq 0);
		}

		// Need to test if MEMBERPASSWORD is null that we don't try and test an empty string versus null
		if (not IsNull(members.getMEMBERPASSWORD())){
			assertEquals(fromQuery["MEMBERPASSWORD"][1], members.getMEMBERPASSWORD());
		}
		else{
			assertTrue(Len(fromQuery["MEMBERPASSWORD"][1]) eq 0);
		}

		// Need to test if ISADMIN is null that we don't try and test an empty string versus null
		if (not IsNull(members.getISADMIN())){
			assertEquals(fromQuery["ISADMIN"][1], members.getISADMIN());
		}
		else{
			assertTrue(Len(fromQuery["ISADMIN"][1]) eq 0);
		}

		// Need to test if ISACTIVE is null that we don't try and test an empty string versus null
		if (not IsNull(members.getISACTIVE())){
			assertEquals(fromQuery["ISACTIVE"][1], members.getISACTIVE());
		}
		else{
			assertTrue(Len(fromQuery["ISACTIVE"][1]) eq 0);
		}

		// Need to test if ISBLOGSPOTLIGHT is null that we don't try and test an empty string versus null
		if (not IsNull(members.getISBLOGSPOTLIGHT())){
			assertEquals(fromQuery["ISBLOGSPOTLIGHT"][1], members.getISBLOGSPOTLIGHT());
		}
		else{
			assertTrue(Len(fromQuery["ISBLOGSPOTLIGHT"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var members = EntityLoad("members", '1', true);
			members.setFIRSTNAME("Test String");
			members.setLASTNAME("Test String");
			members.setEMAIL("Test String");
			members.setMEMBERPASSWORD("Test Str");
			members.setISADMIN("T");
			members.setISACTIVE("T");
			members.setISBLOGSPOTLIGHT("T");
			EntitySave(members);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var members = EntityNew("members");
			members.setMEMBERID("2");
			members.setFIRSTNAME("Test String");
			members.setLASTNAME("Test String");
			members.setEMAIL("Test String");
			members.setMEMBERPASSWORD("Test Str");
			members.setISADMIN("T");
			members.setISACTIVE("T");
			members.setISBLOGSPOTLIGHT("T");
			EntitySave(members);

			// Now see if we can delete it.
			var membersCopy = EntityLoad("members", members.getMEMBERID(), true);
			EntityDelete(membersCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}