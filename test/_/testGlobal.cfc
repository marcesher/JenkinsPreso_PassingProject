component extends="mxunit.framework.TestCase" {

	void function testIsApplicationWorking() {
		AssertTrue(IsDefined("application"), "This occur might occur because you have not pointed your ColdFusion Builder project to the remotefacade.cfc (http://127.0.0.1/CFO_JenkinsPreso_PassingProject/test/remoteFacade.cfc)in this project.");
	}

}