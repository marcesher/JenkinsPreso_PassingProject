component persistent="true" table="SPONSORS" entityName="sponsors" {

	property name="SPONSORID" column="SPONSORID" ormtype="integer" type="numeric" fieldtype="id" generator="native" length="10" ;
	property name="SPONSORNAME" column="SPONSORNAME" ormtype="string" type="string" length="255" ;
	property name="WEBADDRESS" column="WEBADDRESS" ormtype="string" type="string" length="250" ;
	property name="DESCRIPTION" column="DESCRIPTION" ormtype="string" type="string" length="2147483647" ;
	property name="SPONSORAD" column="SPONSORAD" ormtype="string" type="string" length="50" ;
	property name="ISSPOTLIGHT" column="ISSPOTLIGHT" ormtype="string" type="string" length="1" ;
	property name="CITY" column="CITY" ormtype="string" type="string" length="50" ;
	property name="STATE" column="STATE" ormtype="string" type="string" length="50" ;
	property name="ADDRESS" column="ADDRESS" ormtype="string" type="string" length="50" ;
	property name="POSTALCODE" column="POSTALCODE" ormtype="string" type="string" length="50" ;
	property name="PHONE" column="PHONE" ormtype="string" type="string" length="50" ;
	property name="MAP" column="MAP" ormtype="string" type="string" length="50" ;

	public sponsors function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public sponsors function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "SPONSORID") AND arguments.formstruct.SPONSORID > 0){
			This = EntityLoad("sponsors", arguments.formstruct.SPONSORID, true);
		}
		if (StructKeyExists(arguments.formstruct, "SPONSORNAME")){
			this.setSPONSORNAME(arguments.formstruct.SPONSORNAME);
		}
		if (StructKeyExists(arguments.formstruct, "WEBADDRESS")){
			this.setWEBADDRESS(arguments.formstruct.WEBADDRESS);
		}
		if (StructKeyExists(arguments.formstruct, "DESCRIPTION")){
			this.setDESCRIPTION(arguments.formstruct.DESCRIPTION);
		}
		if (StructKeyExists(arguments.formstruct, "SPONSORAD")){
			this.setSPONSORAD(arguments.formstruct.SPONSORAD);
		}
		if (StructKeyExists(arguments.formstruct, "ISSPOTLIGHT")){
			this.setISSPOTLIGHT(arguments.formstruct.ISSPOTLIGHT);
		}
		if (StructKeyExists(arguments.formstruct, "CITY")){
			this.setCITY(arguments.formstruct.CITY);
		}
		if (StructKeyExists(arguments.formstruct, "STATE")){
			this.setSTATE(arguments.formstruct.STATE);
		}
		if (StructKeyExists(arguments.formstruct, "ADDRESS")){
			this.setADDRESS(arguments.formstruct.ADDRESS);
		}
		if (StructKeyExists(arguments.formstruct, "POSTALCODE")){
			this.setPOSTALCODE(arguments.formstruct.POSTALCODE);
		}
		if (StructKeyExists(arguments.formstruct, "PHONE")){
			this.setPHONE(arguments.formstruct.PHONE);
		}
		if (StructKeyExists(arguments.formstruct, "MAP")){
			this.setMAP(arguments.formstruct.MAP);
		}
		return This;
	}

}