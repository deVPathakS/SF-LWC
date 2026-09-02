@IsTest
private class NoticeBoardControllerTest {
    @IsTest
    static void testGetBackgroundColorDefault() {
        Test.startTest();
        String color = NoticeBoardController.getBackgroundColor();
        Test.stopTest();
        System.assertNotEquals(null, color, 'Color should not be null');
    }

    @IsTest
    static void testGetBackgroundColorWithCustomSetting() {
        Preference__c pref = new Preference__c(
            SetupOwnerId = UserInfo.getOrganizationId(),
            Color__c = 'Blue'
        );
        insert pref;

        Test.startTest();
        String color = NoticeBoardController.getBackgroundColor();
        Test.stopTest();
        System.assertEquals('Blue', color, 'Should retrieve Org level color');
    }
}
