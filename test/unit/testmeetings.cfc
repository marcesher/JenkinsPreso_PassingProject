component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var meetings = EntityNew("meetings");
			meetings.setMEETINGID("2");
			meetings.setBOOKID("2");
			meetings.setHOST("Test String");
			meetings.setMEETINGINFO("Test String");
			EntitySave(meetings);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM MEETINGS WHERE MEETINGID = 1");
		fromQuery = qry.execute().getResult();

		var meetings = EntityLoad("meetings", 1, true);

		// Primary Key Test
		// Need to test if MEETINGID is null that we don't try and test an empty string versus null
		if (not IsNull(meetings.getMEETINGID())){
			assertEquals(numberFormat(fromQuery["MEETINGID"][1], "_"), numberFormat(meetings.getMEETINGID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["MEETINGID"][1]) eq 0);
		}

		// Need to test if BOOKID is null that we don't try and test an empty string versus null
		if (not IsNull(meetings.getBOOKID())){
			assertEquals(numberFormat(fromQuery["BOOKID"][1], "_"), numberFormat(meetings.getBOOKID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["BOOKID"][1]) eq 0);
		}

		// Need to test if HOST is null that we don't try and test an empty string versus null
		if (not IsNull(meetings.getHOST())){
			assertEquals(fromQuery["HOST"][1], meetings.getHOST());
		}
		else{
			assertTrue(Len(fromQuery["HOST"][1]) eq 0);
		}

		// Need to test if MEETINGINFO is null that we don't try and test an empty string versus null
		if (not IsNull(meetings.getMEETINGINFO())){
			assertEquals(fromQuery["MEETINGINFO"][1], meetings.getMEETINGINFO());
		}
		else{
			assertTrue(Len(fromQuery["MEETINGINFO"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var meetings = EntityLoad("meetings", '1', true);
			meetings.setBOOKID("2");
			meetings.setHOST("Test String");
			meetings.setMEETINGINFO("Test String");
			EntitySave(meetings);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var meetings = EntityNew("meetings");
			meetings.setMEETINGID("2");
			meetings.setBOOKID("2");
			meetings.setHOST("Test String");
			meetings.setMEETINGINFO("Test String");
			EntitySave(meetings);

			// Now see if we can delete it.
			var meetingsCopy = EntityLoad("meetings", meetings.getMEETINGID(), true);
			EntityDelete(meetingsCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}