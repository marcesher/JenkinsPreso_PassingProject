component persistent="true" table="BOOKS" entityName="books" {

	property name="BOOKID" column="BOOKID" ormtype="integer" type="numeric" fieldtype="id" generator="native" length="10" ;
	property name="AUTHORID" column="AUTHORID" ormtype="integer" type="numeric" length="10" ;
	property name="TITLE" column="TITLE" ormtype="string" type="string" length="255" ;
	property name="BOOKDESCRIPTION" column="BOOKDESCRIPTION" ormtype="string" type="string" length="2147483647" ;
	property name="BOOKIMAGE" column="BOOKIMAGE" ormtype="string" type="string" length="50" ;
	property name="THUMBNAILIMAGE" column="THUMBNAILIMAGE" ormtype="string" type="string" length="50" ;
	property name="ISSPOTLIGHT" column="ISSPOTLIGHT" ormtype="string" type="string" length="1" ;
	property name="GENRE" column="GENRE" ormtype="string" type="string" length="50" ;

	public books function init() {
		return This;
	}

	public void function nullifyZeroID() {
		if (getIDValue() eq 0){
			variables[getIDName()] = JavaCast("Null", "");
		}
	}

	public books function populate(required struct formStruct ) {
		if (StructKeyExists(arguments.formstruct, "BOOKID") AND arguments.formstruct.BOOKID > 0){
			This = EntityLoad("books", arguments.formstruct.BOOKID, true);
		}
		if (StructKeyExists(arguments.formstruct, "AUTHORID")){
			this.setAUTHORID(arguments.formstruct.AUTHORID);
		}
		if (StructKeyExists(arguments.formstruct, "TITLE")){
			this.setTITLE(arguments.formstruct.TITLE);
		}
		if (StructKeyExists(arguments.formstruct, "BOOKDESCRIPTION")){
			this.setBOOKDESCRIPTION(arguments.formstruct.BOOKDESCRIPTION);
		}
		if (StructKeyExists(arguments.formstruct, "BOOKIMAGE")){
			this.setBOOKIMAGE(arguments.formstruct.BOOKIMAGE);
		}
		if (StructKeyExists(arguments.formstruct, "THUMBNAILIMAGE")){
			this.setTHUMBNAILIMAGE(arguments.formstruct.THUMBNAILIMAGE);
		}
		if (StructKeyExists(arguments.formstruct, "ISSPOTLIGHT")){
			this.setISSPOTLIGHT(arguments.formstruct.ISSPOTLIGHT);
		}
		if (StructKeyExists(arguments.formstruct, "GENRE")){
			this.setGENRE(arguments.formstruct.GENRE);
		}
		return This;
	}

}