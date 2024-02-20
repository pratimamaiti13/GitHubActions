import { LightningElement } from 'lwc';

export default class PatimaLWC extends LightningElement {
    // Faulty performance: Synchronous heavy computation during rendering

    connectedCallback() {
        // Best Practices: Move heavy computation out of the rendering lifecycle
        this.performHeavyComputation();
    }

    performHeavyComputation() {
        // Performance: Move heavy computation out of the rendering lifecycle
        // and execute asynchronously to avoid blocking the main thread
        setTimeout(() => {
            // Perform heavy computation here
        }, 0);
    }
}
