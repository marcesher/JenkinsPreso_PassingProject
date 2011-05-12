component extends="mxunit.framework.TestCase" {

	void function testCreate() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var coupons = EntityNew("coupons");
			coupons.setCOUPONID("2");
			coupons.setSPONSORID("2");
			coupons.setCOUPON("Test String");
			coupons.setEXPIRATIONDATE("{ts '2000-01-01 00:00:00'}");
			EntitySave(coupons);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testRead() {

		var fromQuery = "";

		var qry = new Query(datasource="cfbookclub");
		qry.setSQL("SELECT * FROM COUPONS WHERE COUPONID = 1");
		fromQuery = qry.execute().getResult();

		var coupons = EntityLoad("coupons", 1, true);

		// Primary Key Test
		// Need to test if COUPONID is null that we don't try and test an empty string versus null
		if (not IsNull(coupons.getCOUPONID())){
			assertEquals(numberFormat(fromQuery["COUPONID"][1], "_"), numberFormat(coupons.getCOUPONID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["COUPONID"][1]) eq 0);
		}

		// Need to test if SPONSORID is null that we don't try and test an empty string versus null
		if (not IsNull(coupons.getSPONSORID())){
			assertEquals(numberFormat(fromQuery["SPONSORID"][1], "_"), numberFormat(coupons.getSPONSORID(), "_"));
		}
		else{
			assertTrue(Len(fromQuery["SPONSORID"][1]) eq 0);
		}

		// Need to test if COUPON is null that we don't try and test an empty string versus null
		if (not IsNull(coupons.getCOUPON())){
			assertEquals(fromQuery["COUPON"][1], coupons.getCOUPON());
		}
		else{
			assertTrue(Len(fromQuery["COUPON"][1]) eq 0);
		}

		// Need to test if EXPIRATIONDATE is null that we don't try and test an empty string versus null
		if (not IsNull(coupons.getEXPIRATIONDATE())){
			var formatedExpected = DateFormat(fromQuery["EXPIRATIONDATE"][1], "yyyy-dd-mm") & " " & TimeFormat(fromQuery["EXPIRATIONDATE"][1], "hh:mm:ss.l");
			var formatedActual = DateFormat(coupons.getEXPIRATIONDATE(), "yyyy-dd-mm") & " " & TimeFormat(coupons.getEXPIRATIONDATE(), "hh:mm:ss.l");
			assertEquals(formatedExpected, formatedActual);
		}
		else{
			assertTrue(Len(fromQuery["EXPIRATIONDATE"][1]) eq 0);
		}


	}

	void function testUpdate() {

		transaction action="begin"{
			var coupons = EntityLoad("coupons", '1', true);
			coupons.setSPONSORID("2");
			coupons.setCOUPON("Test String");
			coupons.setEXPIRATIONDATE("{ts '2000-01-01 00:00:00'}");
			EntitySave(coupons);

			// Make it go away!
			transactionRollback();
		};

	}

	void function testDelete() {

		var fromHQL = "";

		transaction action="begin"{

			// See if we can create an object
			var coupons = EntityNew("coupons");
			coupons.setCOUPONID("2");
			coupons.setSPONSORID("2");
			coupons.setCOUPON("Test String");
			coupons.setEXPIRATIONDATE("{ts '2000-01-01 00:00:00'}");
			EntitySave(coupons);

			// Now see if we can delete it.
			var couponsCopy = EntityLoad("coupons", coupons.getCOUPONID(), true);
			EntityDelete(couponsCopy);

			// Make it go away!
			transactionRollback();
		};

	}

}