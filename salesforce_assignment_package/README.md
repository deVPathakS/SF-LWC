# Salesforce Developer Assignment Implementation

This package contains complete Salesforce metadata and source code for Assignment Parts 1 and 2.

---

## 📦 Package Structure

```
├── force-app/main/default/
│   ├── classes/
│   │   ├── NoticeBoardController.cls
│   │   ├── NoticeBoardController.cls-meta.xml
│   │   ├── NoticeBoardControllerTest.cls
│   │   └── NoticeBoardControllerTest.cls-meta.xml
│   ├── labels/
│   │   └── CustomLabels.labels-meta.xml
│   ├── lwc/
│   │   └── noticeBoard/
│   │       ├── noticeBoard.html
│   │       ├── noticeBoard.js
│   │       ├── noticeBoard.css
│   │       └── noticeBoard.js-meta.xml
│   ├── objects/
│   │   ├── Preference__c/ (Hierarchy Custom Setting)
│   │   └── Project_Item__c/ (Part 2 Custom Object with Record Types & Fields)
│   ├── objectTranslations/
│   │   └── Project_Item__c-de/
│   └── translations/
│       └── de.translation-meta.xml (German Translation Workbench)
└── sfdx-project.json
```

---

## 🚀 Step-by-Step Execution Guide

### Part 1: Hierarchy Custom Setting & LWC Notice Board

1. **Deploy Metadata**:
   Deploy the project into your Salesforce scratch org or developer edition org:
   ```bash
   sf project deploy start
   ```

2. **Populate Custom Setting Hierarchy Data**:
   * Navigate to **Setup** > **Custom Settings** > **Preference** > click **Manage**.
   * **Default Org Level**: Click **New** in the top section -> set `Color__c` to `Blue` (or `#E3F2FD`).
   * **Profile Level (System Administrator)**: Click **New** in the bottom section -> choose Profile `System Administrator` -> set `Color__c` to `Red` (or `#FFEBEE`).
   * **Profile Level (Custom Non-Admin Profile)**: Click **New** -> choose your non-admin profile -> set `Color__c` to `Green` (or `#E8F5E9`).
   * **User Level**: Click **New** -> choose your target User -> set `Color__c` to `Grey` (or `#F5F5F5`).

3. **Translation Workbench Configuration**:
   * Go to **Setup** > **Translation Settings** > Enable German (`de`).
   * Add your user as an active translator.
   * Translations for labels (`Notice_Board_Heading`, `Notice_Body`, `ReportError`, `ThankYou`) are included in `de.translation-meta.xml`.

4. **Add LWC to Account Record Page**:
   * Open any **Account** record in Lightning Experience.
   * Click the **Setup Gear icon** > **Edit Page**.
   * Drag the `Notice Board` component onto the page layout and click **Save** & **Activate** (Assign as Org Default).

5. **Test Dynamic Behavior**:
   * View the Account record page: heading is centered & bold; body is italic; background matches hierarchy precedence (User > Profile > Org).
   * Click **Report Error** -> button text updates immediately to *"Thank you for submitting the feedback"*.
   * Change user language to **German** under **Settings** > **Language & Time Zone** -> refresh page to see translated notice and button.

---

### Part 2: Custom Object, All Data Types & Translated Record Types

1. **Custom Object**: `Project_Item__c` with AutoNumber name field `PI-{0000}`.
2. **Field Types Included**:
   * Checkbox (`Is_Active__c`)
   * Currency (`Budget_Amount__c`)
   * Date (`Due_Date__c`)
   * DateTime (`Scheduled_Timestamp__c`)
   * Email (`Primary_Contact_Email__c`)
   * Lookup Relationship (`Account_Lookup__c`)
   * Number (`Estimated_Hours__c`)
   * Percent (`Discount_Percentage__c`)
   * Phone (`Contact_Phone__c`)
   * Picklist (`Item_Status__c`)
   * Multi-Select Picklist (`Skill_Tags__c`)
   * Text (`Short_Description__c`)
   * Text Area (`Overview_Notes__c`)
   * Long Text Area (`Detailed_Specification__c`)
   * URL (`Documentation_URL__c`)
   * Time (`Operating_Hours_Start__c`)
3. **Record Types & German Translations**:
   * `Internal_Project` (Translated to *Internes Projekt*)
   * `Client_Project` (Translated to *Kundenprojekt*)

---

## 📸 Screenshots Required for Submission

1. **Custom Labels**: List view showing the 4 created labels in English.
2. **Hierarchy Custom Setting**: The `Manage` page showing Org level (`Blue`), Admin profile (`Red`), non-admin profile (`Green`), and User level (`Grey`).
3. **Account Record Page (English)**: Component displaying bold centered heading, italic body, background color based on active user, and button state.
4. **Account Record Page (German)**: User language set to German showing translated labels.
5. **Button Click Transition**: Screenshot showing the button changing to *Thank you for submitting the feedback*.
6. **Custom Object Fields & Record Types**: Setup Object Manager view showing all fields and the 2 Record Types.
