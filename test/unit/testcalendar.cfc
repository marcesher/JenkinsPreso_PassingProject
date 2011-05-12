component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var calendar = EntityNew("calendar");
			calendar.setCALENDARID("2");
			calendar.setMEETINGID("2");
			calendar.setCALENDARDATE("{ts '2000-01-02 00:00:00'}");
			calendar.setSTARTTIME("{ts '2000-01-01 00:00:00'}");
			calendar.setADDITIONALINFO("Test String");
			calendar.setISAUTHORAVAILABLE("T");
			EntitySave(calendar);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM CALENDAR WHERE CALENDARID = 1");
		fromQuery = qry.execute().getResult();

		var calendar = EntityLoad("calendar", 1, true);

		// Primary Key Test
		// Need to test if CALENDARID is null that we don't try and test an empty string versus null
		if (not IsNull(calendar.getCALENDARID())){
			assertEquals(numberFormat(fromQuery["CALENDARID"][1], "_"), numberFormat(calendar.getCALENDARID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["CALENDARID"][1]) eq 0);
		}

		// Need to test if MEETINGID is null that we don't try and test an empty string versus null
		if (not IsNull(calendar.getMEETINGID())){
			assertEquals(numberFormat(fromQuery["MEETINGID"][1], "_"), numberFormat(calendar.getMEETINGID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["MEETINGID"][1]) eq 0);
		}

		// Need to test if CALENDARDATE is null that we don't try and test an empty string versus null
		if (not IsNull(calendar.getCALENDARDATE())){
			var formatedExpected = DateFormat(fromQuery["CALENDARDATE"][1], "yyyy-dd-mm") & " " & TimeFormat(fromQuery["CALENDARDATE"][1], "hh:mm:ss.l");
			var formatedActual = DateFormat(calendar.getCALENDARDATE(), "yyyy-dd-mm") & " " & TimeFormat(calendar.getCALENDARDATE(), "hh:mm:ss.l");
			assertEquals(formatedExpected, formatedActual);
		}
		else{
			assertTrue(Len(fromQuery["CALENDARDATE"][1]) eq 0);
		}

		// Need to test if STARTTIME is null that we don't try and test an empty string versus null
		if (not IsNull(calendar.getSTARTTIME())){
			var formatedExpected = DateFormat(fromQuery["STARTTIME"][1], "yyyy-dd-mm") & " " & TimeFormat(fromQuery["STARTTIME"][1], "hh:mm:ss.l");
			var formatedActual = DateFormat(calendar.getSTARTTIME(), "yyyy-dd-mm") & " " & TimeFormat(calendar.getSTARTTIME(), "hh:mm:ss.l");
			assertEquals(formatedExpected, formatedActual);
		}
		else{
			assertTrue(Len(fromQuery["STARTTIME"][1]) eq 0);
		}

		// Need to test if ADDITIONALINFO is null that we don't try and test an empty string versus null
		if (not IsNull(calendar.getADDITIONALINFO())){
			assertEquals(fromQuery["ADDITIONALINFO"][1], calendar.getADDITIONALINFO());
		}
		else{
			assertTrue(Len(fromQuery["ADDITIONALINFO"][1]) eq 0);
		}

		// Need to test if ISAUTHORAVAILABLE is null that we don't try and test an empty string versus null
		if (not IsNull(calendar.getISAUTHORAVAILABLE())){
			assertEquals(fromQuery["ISAUTHORAVAILABLE"][1], calendar.getISAUTHORAVAILABLE());
		}
		else{
			assertTrue(Len(fromQuery["ISAUTHORAVAILABLE"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var calendar = EntityLoad("calendar", '1', true);
			calendar.setMEETINGID("2");
			calendar.setCALENDARDATE("{ts '2000-01-02 00:00:00'}");
			calendar.setSTARTTIME("{ts '2000-01-01 00:00:00'}");
			calendar.setADDITIONALINFO("Test String");
			calendar.setISAUTHORAVAILABLE("T");
			EntitySave(calendar);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var calendar = EntityNew("calendar");
			calendar.setCALENDARID("2");
			calendar.setMEETINGID("2");
			calendar.setCALENDARDATE("{ts '2000-01-02 00:00:00'}");
			calendar.setSTARTTIME("{ts '2000-01-01 00:00:00'}");
			calendar.setADDITIONALINFO("Test String");
			calendar.setISAUTHORAVAILABLE("T");
			EntitySave(calendar);

			// Now see if we can delete it.
			var calendarCopy = EntityLoad("calendar", calendar.getCALENDARID(), true);
			EntityDelete(calendarCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}