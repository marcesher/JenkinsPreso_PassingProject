component persistent="true" table="MEMBERDOWNLOAD" entityName="memberdownload" {

	property name="MEMBERDOWNLOADID" column="MEMBERDOWNLOADID" ormtype="integer" type="numeric" fieldtype="id" generator="native" length="10" ;
	property name="MEMBERID" column="MEMBERID" ormtype="integer" type="numeric" length="10" ;
	property name="COUPONID" column="COUPONID" ormtype="integer" type="numeric" length="10" ;
	property name="COUPONCODE" column="COUPONCODE" ormtype="string" type="string" length="50" ;

	public memberdownload function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public memberdownload function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "MEMBERDOWNLOADID") AND arguments.formstruct.MEMBERDOWNLOADID > 0){
			This = EntityLoad("memberdownload", arguments.formstruct.MEMBERDOWNLOADID, true);
		}
		if (StructKeyExists(arguments.formstruct, "MEMBERID")){
			this.setMEMBERID(arguments.formstruct.MEMBERID);
		}
		if (StructKeyExists(arguments.formstruct, "COUPONID")){
			this.setCOUPONID(arguments.formstruct.COUPONID);
		}
		if (StructKeyExists(arguments.formstruct, "COUPONCODE")){
			this.setCOUPONCODE(arguments.formstruct.COUPONCODE);
		}
		return This;
	}

}