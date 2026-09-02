public with sharing class NoticeBoardController {
    /**
     * @description Retrieves the configured hierarchy color setting for the current user/profile/org context.
     * @return String color name or hex value
     */
    @AuraEnabled(cacheable=true)
    public static String getBackgroundColor() {
        try {
            Preference__c pref = Preference__c.getInstance();
            if (pref != null && String.isNotBlank(pref.Color__c)) {
                return pref.Color__c.trim();
            }
            return 'white';
        } catch (Exception ex) {
            System.debug(LoggingLevel.ERROR, 'Error retrieving Preference custom setting: ' + ex.getMessage());
            return 'white';
        }
    }
}
