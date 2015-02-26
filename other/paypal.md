Paypal
======

Integration options
===================

Website Payments Standard
-------------------------

- HTML buttons – eg: ‘Pay Now’ and ‘Add to Cart’.

Website Payments Pro
--------------------

- Never leave the site.
- Uses API’s behind the scenes.
- Costs $30 per month.

Express Checkout
----------------

- The idea is to let the customer login to paypal on the very first step of the checkout, then it returns to the website with their address information.
- Requires customers to have a paypal account – there is no ‘credit card’ option. Assumes website already deals with that.
- Uses API methods.

Payflow
-------

- Is an Internet merchant account as well as paypal. Eg: Interacts with financial instituions.
- Customers do not require a paypal account.
- Requires setup fee and monthly fee.
- Can be integrated with either;
  - Payflow Link
    - HTML method.
    - Paypal hosted the entire way.
  - Payflow Pro
    - Paypal API - most customized method.

Other services
==============

IPN
---

aka Instant Payment Notification

Paypal hits this URL after every successful payment with the payment details

PDT
---

aka Payment Data Transfer

Retrieve details about a payment transaction.

Just need to post a ‘transactionID’ to a URL and it will return results. Useful for receipts.

Paypal API
----------

Has two types;

### SOAP

Well, we know what a SOAP web service is.. :)

### NVP

aka Name Value Pairs

Requests to Paypal API are just sent using plain HTML requests. Lightweight.
