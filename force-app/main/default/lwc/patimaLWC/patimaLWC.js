import { LightningElement } from 'lwc';

export default class PatimaLWC extends LightningElement {
    // Faulty performance: Synchronous heavy computation during rendering
    renderedCallback() {
        for (let i = 0; i < 1000000; i++) {
            // Perform heavy computation
        }
    }
}