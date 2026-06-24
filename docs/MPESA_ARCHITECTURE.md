# Future M-Pesa Architecture

*Status: Documentation Only. No active codebase integration.*

## Roadmap
1. **Daraja API Integration**: Transition from STK push to full B2B/B2C Daraja flows.
2. **Till/Paybill Management**: Support multiple business till numbers synced via backend.
3. **Transaction Matching**: Implement an automated listener in the Node.js backend to map M-Pesa receipts to active POS sales.
4. **Owner Dashboard**: Add an M-Pesa reconciliation tab in the Boss App.

All future M-Pesa modules will be completely decoupled from the core Operations App UI to ensure stability.
