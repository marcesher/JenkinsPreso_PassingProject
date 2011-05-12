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
			var pollresponses = EntityNew("pollresponses");
			pollresponses.setPOLLID("2");
			pollresponses.setA1("2");
			pollresponses.setA2("2");
			pollresponses.setA3("2");
			pollresponses.setA4("2");
			pollresponses.setA5("2");
			pollresponses.setTOTAL("2");
			EntitySave(pollresponses);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM POLLRESPONSES WHERE POLLID = 1");
		fromQuery = qry.execute().getResult();

		var pollresponses = EntityLoad("pollresponses", 1, true);

		// Primary Key Test
		// Need to test if POLLID is null that we don't try and test an empty string versus null
		if (not IsNull(pollresponses.getPOLLID())){
			assertEquals(numberFormat(fromQuery["POLLID"][1], "_"), numberFormat(pollresponses.getPOLLID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["POLLID"][1]) eq 0);
		}

		// Need to test if A1 is null that we don't try and test an empty string versus null
		if (not IsNull(pollresponses.getA1())){
			assertEquals(numberFormat(fromQuery["A1"][1], "_"), numberFormat(pollresponses.getA1(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["A1"][1]) eq 0);
		}

		// Need to test if A2 is null that we don't try and test an empty string versus null
		if (not IsNull(pollresponses.getA2())){
			assertEquals(numberFormat(fromQuery["A2"][1], "_"), numberFormat(pollresponses.getA2(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["A2"][1]) eq 0);
		}

		// Need to test if A3 is null that we don't try and test an empty string versus null
		if (not IsNull(pollresponses.getA3())){
			assertEquals(numberFormat(fromQuery["A3"][1], "_"), numberFormat(pollresponses.getA3(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["A3"][1]) eq 0);
		}

		// Need to test if A4 is null that we don't try and test an empty string versus null
		if (not IsNull(pollresponses.getA4())){
			assertEquals(numberFormat(fromQuery["A4"][1], "_"), numberFormat(pollresponses.getA4(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["A4"][1]) eq 0);
		}

		// Need to test if A5 is null that we don't try and test an empty string versus null
		if (not IsNull(pollresponses.getA5())){
			assertEquals(numberFormat(fromQuery["A5"][1], "_"), numberFormat(pollresponses.getA5(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["A5"][1]) eq 0);
		}

		// Need to test if TOTAL is null that we don't try and test an empty string versus null
		if (not IsNull(pollresponses.getTOTAL())){
			assertEquals(numberFormat(fromQuery["TOTAL"][1], "_"), numberFormat(pollresponses.getTOTAL(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["TOTAL"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var pollresponses = EntityLoad("pollresponses", '1', true);
			pollresponses.setA1("2");
			pollresponses.setA2("2");
			pollresponses.setA3("2");
			pollresponses.setA4("2");
			pollresponses.setA5("2");
			pollresponses.setTOTAL("2");
			EntitySave(pollresponses);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var pollresponses = EntityNew("pollresponses");
			pollresponses.setPOLLID("2");
			pollresponses.setA1("2");
			pollresponses.setA2("2");
			pollresponses.setA3("2");
			pollresponses.setA4("2");
			pollresponses.setA5("2");
			pollresponses.setTOTAL("2");
			EntitySave(pollresponses);

			// Now see if we can delete it.
			var pollresponsesCopy = EntityLoad("pollresponses", pollresponses.getPOLLID(), true);
			EntityDelete(pollresponsesCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}