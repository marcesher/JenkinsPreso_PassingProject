component persistent="true" table="COUPONS" entityName="coupons" {

	property name="COUPONID" column="COUPONID" ormtype="integer" type="numeric" fieldtype="id" generator="native" length="10" ;
	property name="SPONSORID" column="SPONSORID" ormtype="integer" type="numeric" length="10" ;
	property name="COUPON" column="COUPON" ormtype="string" type="string" length="2147483647" ;
	property name="EXPIRATIONDATE" column="EXPIRATIONDATE" ormtype="timestamp" type="date" length="26" ;

	public coupons function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public coupons function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "COUPONID") AND arguments.formstruct.COUPONID > 0){
			This = EntityLoad("coupons", arguments.formstruct.COUPONID, true);
		}
		if (StructKeyExists(arguments.formstruct, "SPONSORID")){
			this.setSPONSORID(arguments.formstruct.SPONSORID);
		}
		if (StructKeyExists(arguments.formstruct, "COUPON")){
			this.setCOUPON(arguments.formstruct.COUPON);
		}
		if (StructKeyExists(arguments.formstruct, "EXPIRATIONDATE")){
			this.setEXPIRATIONDATE(arguments.formstruct.EXPIRATIONDATE);
		}
		return This;
	}

}