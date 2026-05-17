# Product Requirements Document

## Overview
FreshCart Market is an e-commerce management application for fruit and vegetable products, carts, payments, orders, reporting, and store settings. This request adds a public landing page that introduces the FreshCart store experience before authentication, provides clear calls to action for signing in, and preserves the existing authenticated dashboard and navbar flows after login.

## Goals
- Add a polished public landing page for unauthenticated visitors at the root route.
- Keep the existing login experience available at /login.
- Ensure authenticated users visiting / are redirected to /dashboard.
- Provide clear calls to action from the landing page to login and core product/cart value propositions.
- Preserve all existing protected routes and navbar links after login.
- Avoid unnecessary backend or database changes because the landing page is static/public UI.

## User Stories
- As a **visitor**, I want **to see a landing page before logging in**, so that **I can understand what FreshCart Market offers before entering credentials**
- As a **visitor**, I want **a clear sign-in call to action**, so that **I can quickly access the FreshCart dashboard using my account**
- As a **store admin**, I want **authenticated routes and navbar navigation to keep working after login**, so that **I can manage products, carts, orders, reports, and settings without routing issues**
- As a **returning authenticated user**, I want **to be redirected from the public landing page to my dashboard**, so that **I do not have to log in again or manually navigate**
- As a **mobile visitor**, I want **the landing page to be responsive**, so that **I can view the store introduction and sign in from any device**

## Features
### Public Landing Page (P0)
Create a new unauthenticated landing page for FreshCart Market with hero messaging, produce-focused branding, benefit highlights, and sign-in calls to action.

### Landing Route Integration (P0)
Update frontend routing so / renders the landing page for unauthenticated users and redirects authenticated users to /dashboard.

### Login Route Preservation (P0)
Keep /login as the dedicated authentication route and ensure existing login behavior redirects users to /dashboard after successful authentication.

### Authenticated Navbar Preservation (P0)
Ensure the authenticated header/navbar remains visible only on protected app routes and all existing NavLink targets continue matching real routes.

### Landing Page Responsive UX (P1)
Design the landing page with responsive layout, readable typography, accessible buttons/links, and consistent FreshCart fruit-and-vegetable visual style.

## Non-Functional Requirements
- Landing page must not require authentication.
- Landing page must render without calling backend APIs.
- Internal navigation must use React Router Link/NavLink instead of raw anchor tags for app routes.
- All Link/NavLink destinations must correspond to defined routes.
- The frontend route shell must keep protected pages reachable: /dashboard, /cart, /orders, /products, /reports, and /settings.
- The login page must remain accessible at /login for unauthenticated users.
- Authenticated users should not see the public landing page when visiting /; they should be redirected to /dashboard.
- Unauthenticated users attempting protected routes must be redirected to /login.
- The implementation should be minimal and avoid backend/database changes unless future dynamic landing content is introduced.
- Existing database migration and seed scripts must remain in sync with runtime schema; no landing-page schema changes are expected.

## Assumptions
- The landing page is a static frontend page and does not require CMS-backed or database-backed content.
- The application already has working authentication using localStorage token storage.
- The current protected app experience starts at /dashboard after login.
- The FreshCart Market brand should continue using green/orange produce-themed styling.
- The primary call to action on the landing page should navigate to /login.
- Existing backend APIs for auth, products, cart, and orders remain unchanged for this request.
- No new database tables, fields, migrations, or seed data are required for the landing page.

## Constraints
- Make minimal changes focused on frontend routing and UI.
- Preserve the existing folder structure under frontend/, backend/, and db/.
- Do not remove existing protected routes or navbar destinations.
- Do not introduce raw internal href navigation that bypasses React Router.
- Do not change backend API contracts for this static landing page request.
- Do not alter database schema unless a future requirement introduces dynamic landing content.
