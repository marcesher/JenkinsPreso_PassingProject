component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var memberdownload = EntityNew("memberdownload");
			memberdownload.setMEMBERDOWNLOADID("2");
			memberdownload.setMEMBERID("2");
			memberdownload.setCOUPONID("2");
			memberdownload.setCOUPONCODE("Test String");
			EntitySave(memberdownload);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM MEMBERDOWNLOAD WHERE MEMBERDOWNLOADID = 1");
		fromQuery = qry.execute().getResult();

		var memberdownload = EntityLoad("memberdownload", 1, true);

		// Primary Key Test
		// Need to test if MEMBERDOWNLOADID is null that we don't try and test an empty string versus null
		if (not IsNull(memberdownload.getMEMBERDOWNLOADID())){
			assertEquals(numberFormat(fromQuery["MEMBERDOWNLOADID"][1], "_"), numberFormat(memberdownload.getMEMBERDOWNLOADID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["MEMBERDOWNLOADID"][1]) eq 0);
		}

		// Need to test if MEMBERID is null that we don't try and test an empty string versus null
		if (not IsNull(memberdownload.getMEMBERID())){
			assertEquals(numberFormat(fromQuery["MEMBERID"][1], "_"), numberFormat(memberdownload.getMEMBERID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["MEMBERID"][1]) eq 0);
		}

		// Need to test if COUPONID is null that we don't try and test an empty string versus null
		if (not IsNull(memberdownload.getCOUPONID())){
			assertEquals(numberFormat(fromQuery["COUPONID"][1], "_"), numberFormat(memberdownload.getCOUPONID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["COUPONID"][1]) eq 0);
		}

		// Need to test if COUPONCODE is null that we don't try and test an empty string versus null
		if (not IsNull(memberdownload.getCOUPONCODE())){
			assertEquals(fromQuery["COUPONCODE"][1], memberdownload.getCOUPONCODE());
		}
		else{
			assertTrue(Len(fromQuery["COUPONCODE"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var memberdownload = EntityLoad("memberdownload", '1', true);
			memberdownload.setMEMBERID("2");
			memberdownload.setCOUPONID("2");
			memberdownload.setCOUPONCODE("Test String");
			EntitySave(memberdownload);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var memberdownload = EntityNew("memberdownload");
			memberdownload.setMEMBERDOWNLOADID("2");
			memberdownload.setMEMBERID("2");
			memberdownload.setCOUPONID("2");
			memberdownload.setCOUPONCODE("Test String");
			EntitySave(memberdownload);

			// Now see if we can delete it.
			var memberdownloadCopy = EntityLoad("memberdownload", memberdownload.getMEMBERDOWNLOADID(), true);
			EntityDelete(memberdownloadCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}