import { LightningElement } from 'lwc';

export default class PatimaLWC extends LightningElement {
    // Faulty performance: Synchronous heavy computation during rendering
    renderedCallback() {
       if (x === -0) {
    // doSomething()...
    }
    }
}
