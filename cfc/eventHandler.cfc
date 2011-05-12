component implements="CFIDE.ORM.IEventHandler" {

	public void function postDelete(any entity ) {
	}

	public void function postInsert(any entity ) {
	}

	public void function postLoad(any entity ) {
	}

	public void function postUpdate(any entity ) {
	}

	public void function preDelete(any entity ) {
	}

	public void function preInsert(any entity ) {
		if (structKeyExists(entity, "setcreatedOn")){
			entity.setcreatedOn(now());
		}

		if (structKeyExists(entity, "setupdatedOn")){
			entity.setupdatedOn(now());
		}
	}

	public void function preLoad(any entity ) {
	}

	public void function preUpdate(any entity , struct oldData ) {
		if (structKeyExists(entity, "setupdatedOn")){
			entity.setupdatedOn(now());
		}
	}

}