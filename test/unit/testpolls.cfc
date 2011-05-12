component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var polls = EntityNew("polls");
			polls.setPOLLID("2");
			polls.setQUESTION("Test String");
			polls.setANSWER1("Test String");
			polls.setANSWER2("Test String");
			polls.setANSWER3("Test String");
			polls.setANSWER4("Test String");
			polls.setANSWER5("Test String");
			polls.setISLIVE("T");
			EntitySave(polls);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM POLLS WHERE POLLID = 1");
		fromQuery = qry.execute().getResult();

		var polls = EntityLoad("polls", 1, true);

		// Primary Key Test
		// Need to test if POLLID is null that we don't try and test an empty string versus null
		if (not IsNull(polls.getPOLLID())){
			assertEquals(numberFormat(fromQuery["POLLID"][1], "_"), numberFormat(polls.getPOLLID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["POLLID"][1]) eq 0);
		}

		// Need to test if QUESTION is null that we don't try and test an empty string versus null
		if (not IsNull(polls.getQUESTION())){
			assertEquals(fromQuery["QUESTION"][1], polls.getQUESTION());
		}
		else{
			assertTrue(Len(fromQuery["QUESTION"][1]) eq 0);
		}

		// Need to test if ANSWER1 is null that we don't try and test an empty string versus null
		if (not IsNull(polls.getANSWER1())){
			assertEquals(fromQuery["ANSWER1"][1], polls.getANSWER1());
		}
		else{
			assertTrue(Len(fromQuery["ANSWER1"][1]) eq 0);
		}

		// Need to test if ANSWER2 is null that we don't try and test an empty string versus null
		if (not IsNull(polls.getANSWER2())){
			assertEquals(fromQuery["ANSWER2"][1], polls.getANSWER2());
		}
		else{
			assertTrue(Len(fromQuery["ANSWER2"][1]) eq 0);
		}

		// Need to test if ANSWER3 is null that we don't try and test an empty string versus null
		if (not IsNull(polls.getANSWER3())){
			assertEquals(fromQuery["ANSWER3"][1], polls.getANSWER3());
		}
		else{
			assertTrue(Len(fromQuery["ANSWER3"][1]) eq 0);
		}

		// Need to test if ANSWER4 is null that we don't try and test an empty string versus null
		if (not IsNull(polls.getANSWER4())){
			assertEquals(fromQuery["ANSWER4"][1], polls.getANSWER4());
		}
		else{
			assertTrue(Len(fromQuery["ANSWER4"][1]) eq 0);
		}

		// Need to test if ANSWER5 is null that we don't try and test an empty string versus null
		if (not IsNull(polls.getANSWER5())){
			assertEquals(fromQuery["ANSWER5"][1], polls.getANSWER5());
		}
		else{
			assertTrue(Len(fromQuery["ANSWER5"][1]) eq 0);
		}

		// Need to test if ISLIVE is null that we don't try and test an empty string versus null
		if (not IsNull(polls.getISLIVE())){
			assertEquals(fromQuery["ISLIVE"][1], polls.getISLIVE());
		}
		else{
			assertTrue(Len(fromQuery["ISLIVE"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var polls = EntityLoad("polls", '1', true);
			polls.setQUESTION("Test String");
			polls.setANSWER1("Test String");
			polls.setANSWER2("Test String");
			polls.setANSWER3("Test String");
			polls.setANSWER4("Test String");
			polls.setANSWER5("Test String");
			polls.setISLIVE("T");
			EntitySave(polls);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var polls = EntityNew("polls");
			polls.setPOLLID("2");
			polls.setQUESTION("Test String");
			polls.setANSWER1("Test String");
			polls.setANSWER2("Test String");
			polls.setANSWER3("Test String");
			polls.setANSWER4("Test String");
			polls.setANSWER5("Test String");
			polls.setISLIVE("T");
			EntitySave(polls);

			// Now see if we can delete it.
			var pollsCopy = EntityLoad("polls", polls.getPOLLID(), true);
			EntityDelete(pollsCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}