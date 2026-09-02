import { LightningElement, wire } from 'lwc';
import getBackgroundColor from '@salesforce/apex/NoticeBoardController.getBackgroundColor';

// Custom Labels
import noticeHeading from '@salesforce/label/c.Notice_Board_Heading';
import noticeBody from '@salesforce/label/c.Notice_Body';
import reportError from '@salesforce/label/c.ReportError';
import thankYou from '@salesforce/label/c.ThankYou';

export default class NoticeBoard extends LightningElement {
    labels = {
        noticeHeading,
        noticeBody,
        reportError,
        thankYou
    };

    bgColor = '#FFFFFF';
    buttonLabel = this.labels.reportError;

    @wire(getBackgroundColor)
    wiredColor({ error, data }) {
        if (data) {
            this.bgColor = data;
        } else if (error) {
            console.error('Error loading background color preference', error);
        }
    }

    get containerStyle() {
        return `background-color: ${this.bgColor}; border-radius: 8px; transition: background-color 0.3s ease; padding: 1.5rem;`;
    }

    handleReportError() {
        this.buttonLabel = this.labels.thankYou;
    }
}
